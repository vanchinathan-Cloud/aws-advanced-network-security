variable "region" {
  description = "AWS region for the Transit Gateway."
  type        = string
  default     = "us-east-1"
}

variable "inspection_vpc_id" {
  description = "ID of the Inspection VPC."
  type        = string
}

variable "inspection_attachment_subnet_ids" {
  description = "Dedicated TGW attachment subnets in the Inspection VPC (one per AZ)."
  type        = list(string)
}

variable "attachment_ids" {
  description = "Existing attachment IDs keyed by prod, uat, nonprod, shared, dr, onprem."
  type        = map(string)
}

variable "share_principals" {
  description = "Account IDs or organization ARN to share the Transit Gateway with."
  type        = list(string)
  default     = []
}
