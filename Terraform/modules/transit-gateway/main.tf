terraform {
  required_version = ">= 1.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

# The Transit Gateway. Default association and propagation are turned OFF so that
# nothing is connected to anything unless we say so. This is what isolates environments.
resource "aws_ec2_transit_gateway" "this" {
  description                     = "${var.name} Transit Gateway"
  amazon_side_asn                 = var.amazon_side_asn
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"
  auto_accept_shared_attachments  = "disable"
  dns_support                     = "enable"
  vpn_ecmp_support                = "enable"

  tags = merge(var.tags, { Name = var.name })
}

# One route table per environment.
resource "aws_ec2_transit_gateway_route_table" "this" {
  for_each = toset(var.route_table_names)

  transit_gateway_id = aws_ec2_transit_gateway.this.id
  tags               = merge(var.tags, { Name = each.key })
}

# Attachments for VPCs in this account (for example the Inspection VPC).
resource "aws_ec2_transit_gateway_vpc_attachment" "this" {
  for_each = var.vpc_attachments

  transit_gateway_id = aws_ec2_transit_gateway.this.id
  vpc_id             = each.value.vpc_id
  subnet_ids         = each.value.subnet_ids

  # Keeps traffic for one flow on the same firewall in both directions.
  appliance_mode_support = each.value.appliance_mode ? "enable" : "disable"

  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false

  tags = merge(var.tags, { Name = each.key })
}

locals {
  # All known attachment IDs by name (local VPC attachments + external ones).
  attachment_ids = merge(
    { for k, v in aws_ec2_transit_gateway_vpc_attachment.this : k => v.id },
    { for k, v in var.external_attachments : k => v.attachment_id }
  )

  # Which route table each attachment belongs to.
  attachment_route_tables = merge(
    { for k, v in var.vpc_attachments : k => v.route_table },
    { for k, v in var.external_attachments : k => v.route_table }
  )
}

# Each attachment is associated with exactly one route table.
resource "aws_ec2_transit_gateway_route_table_association" "this" {
  for_each = local.attachment_route_tables

  transit_gateway_attachment_id  = local.attachment_ids[each.key]
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.this[each.value].id
}

# Routes an attachment advertises into a route table.
resource "aws_ec2_transit_gateway_route_table_propagation" "this" {
  for_each = { for p in var.propagations : "${p.attachment}->${p.route_table}" => p }

  transit_gateway_attachment_id  = local.attachment_ids[each.value.attachment]
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.this[each.value.route_table].id
}

resource "aws_ec2_transit_gateway_route" "this" {
  for_each = { for r in var.static_routes : "${r.route_table}:${r.cidr}" => r }

  destination_cidr_block         = each.value.cidr
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.this[each.value.route_table].id
  blackhole                      = each.value.blackhole
  transit_gateway_attachment_id  = each.value.blackhole ? null : local.attachment_ids[each.value.attachment]
}

# Share the Transit Gateway with other accounts using AWS RAM.
resource "aws_ram_resource_share" "this" {
  count = length(var.share_principals) > 0 ? 1 : 0

  name                      = "${var.name}-tgw-share"
  allow_external_principals = false
  tags                      = var.tags
}

resource "aws_ram_resource_association" "this" {
  count = length(var.share_principals) > 0 ? 1 : 0

  resource_arn       = aws_ec2_transit_gateway.this.arn
  resource_share_arn = aws_ram_resource_share.this[0].arn
}

resource "aws_ram_principal_association" "this" {
  for_each = toset(var.share_principals)

  principal          = each.value
  resource_share_arn = aws_ram_resource_share.this[0].arn
}
