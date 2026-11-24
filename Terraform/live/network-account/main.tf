terraform {
  required_version = ">= 1.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

locals {
  spokes = ["prod", "uat", "nonprod", "shared", "dr", "onprem"]
}

module "tgw" {
  source = "../../modules/transit-gateway"

  name = "enterprise"

  route_table_names = [
    "TGW-RT-PROD",
    "TGW-RT-UAT",
    "TGW-RT-NONPROD",
    "TGW-RT-SHARED",
    "TGW-RT-SECURITY",
    "TGW-RT-ONPREM",
    "TGW-RT-DR",
  ]

  # The Inspection VPC lives in this design's security path. Appliance mode is on.
  vpc_attachments = {
    inspection = {
      vpc_id         = var.inspection_vpc_id
      subnet_ids     = var.inspection_attachment_subnet_ids
      route_table    = "TGW-RT-SECURITY"
      appliance_mode = true
    }
  }

  # Attachments created in the spoke accounts (and the Direct Connect gateway).
  external_attachments = {
    prod    = { attachment_id = var.attachment_ids["prod"], route_table = "TGW-RT-PROD" }
    uat     = { attachment_id = var.attachment_ids["uat"], route_table = "TGW-RT-UAT" }
    nonprod = { attachment_id = var.attachment_ids["nonprod"], route_table = "TGW-RT-NONPROD" }
    shared  = { attachment_id = var.attachment_ids["shared"], route_table = "TGW-RT-SHARED" }
    dr      = { attachment_id = var.attachment_ids["dr"], route_table = "TGW-RT-DR" }
    onprem  = { attachment_id = var.attachment_ids["onprem"], route_table = "TGW-RT-ONPREM" }
  }

  # 1) The Security route table learns every spoke, so the firewall can send traffic back.
  # 2) Spoke tables learn only what they are allowed to reach (see Routing-Strategy.md):
  #    Prod  -> Shared, DR, On-Prem      UAT/NonProd -> Shared, On-Prem
  propagations = concat(
    [for s in local.spokes : { attachment = s, route_table = "TGW-RT-SECURITY" }],
    [
      { attachment = "shared", route_table = "TGW-RT-PROD" },
      { attachment = "dr", route_table = "TGW-RT-PROD" },
      { attachment = "onprem", route_table = "TGW-RT-PROD" },
      { attachment = "shared", route_table = "TGW-RT-UAT" },
      { attachment = "onprem", route_table = "TGW-RT-UAT" },
      { attachment = "shared", route_table = "TGW-RT-NONPROD" },
      { attachment = "onprem", route_table = "TGW-RT-NONPROD" },
    ]
  )

  # Any other traffic from a spoke goes to the Inspection VPC, where the firewall decides.
  # Prod, UAT and NonProd have no route to each other, so the firewall must also block them.
  static_routes = [
    for rt in ["TGW-RT-PROD", "TGW-RT-UAT", "TGW-RT-NONPROD", "TGW-RT-DR"] :
    { route_table = rt, cidr = "0.0.0.0/0", attachment = "inspection" }
  ]

  share_principals = var.share_principals

  tags = {
    Account   = "network"
    ManagedBy = "terraform"
  }
}
