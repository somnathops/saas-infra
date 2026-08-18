variable "security_group_name" {
  description = "The name of the security group."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the security group will be created."
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