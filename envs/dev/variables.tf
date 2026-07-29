variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "public_subnets" {
  description = "A list of CIDR blocks for the public subnets"
  type = map(object({
    cidr = string
  }))
}

variable "private_subnets" {
  description = "A list of CIDR blocks for the private subnets"
  type = map(object({
    cidr = string
  }))
}

variable "common_tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
}

# variable "nat_gateway_mode" {
#   description = "NAT GW dployment mode"
#   type        = string
#   validation {
#     condition     = contains(["single", "per_az"], var.nat_gateway_mode)
#     error_message = "nat_gateway_mode must be either 'single' or 'per_az'"
#   }
# }

variable "security_group_name" {
  description = "The name of the security group."
  type        = string
}

variable "description" {
  description = "The description of the security group."
  type        = string
  default     = "Managed by Terraform"
}

variable "ingress_rules" {
  description = "The ingress rules for the security group."
  type        = list(object({
    from_port = number
    to_port   = number
    protocol  = string
    cidr_ipv4 = optional(string)
    description = optional(string)
    referenced_security_group_id = optional(string)
  }))
  default = []
}

variable "egress_rules" {
  description = "The egress rules for the security group."
  type        = list(object({
    from_port = number
    to_port   = number
    protocol  = string
    cidr_ipv4 = optional(string)
    description = optional(string)
    referenced_security_group_id = optional(string)
  }))
  default = []
}
