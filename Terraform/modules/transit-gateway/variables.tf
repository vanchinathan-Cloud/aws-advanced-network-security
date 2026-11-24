variable "name" {
  description = "Name prefix for the Transit Gateway and related resources."
  type        = string
}

variable "amazon_side_asn" {
  description = "Private ASN for the AWS side of BGP sessions."
  type        = number
  default     = 64512
}

variable "route_table_names" {
  description = "Names of the Transit Gateway route tables to create (one per environment)."
  type        = list(string)
}

variable "vpc_attachments" {
  description = "VPCs in THIS account to attach (for example the Inspection VPC). Key = attachment name."
  type = map(object({
    vpc_id         = string
    subnet_ids     = list(string)
    route_table    = string
    appliance_mode = optional(bool, false)
  }))
  default = {}
}

variable "external_attachments" {
  description = <<-EOT
    Attachments that already exist (created in spoke accounts, or a Direct Connect gateway
    attachment). The Network account only associates them with a route table.
    Key = attachment name, value = attachment ID and the route table to associate.
  EOT
  type = map(object({
    attachment_id = string
    route_table   = string
  }))
  default = {}
}

variable "propagations" {
  description = "Which attachment advertises its routes into which route table."
  type = list(object({
    attachment  = string
    route_table = string
  }))
  default = []
}

variable "static_routes" {
  description = "Static routes. Set blackhole = true to drop traffic to a CIDR."
  type = list(object({
    route_table = string
    cidr        = string
    attachment  = optional(string)
    blackhole   = optional(bool, false)
  }))
  default = []
}

variable "share_principals" {
  description = "AWS account IDs or organization ARN to share the Transit Gateway with using AWS RAM."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags added to all resources."
  type        = map(string)
  default     = {}
}
