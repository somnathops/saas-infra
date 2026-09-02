variable "region" {
  description = "The AWS region to deploy resources in."
  type        = string
}

variable "tenant_id" {
  description = "Id of the tenant for which the resources are being created"
  type        = string
}
variable "instance_type" {
  description = "The type of instance to use for the EC2 instance."
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The name of the key pair to use for the EC2 instance."
  type        = string
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with the EC2 instance."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to assign to the EC2 instance."
  type        = map(string)
  default = {
    ManagedBy = "Terraform"
  }
}