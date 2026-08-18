variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance."
  type        = string
}

variable "instance_type" {
  description = "The type of instance to use for the EC2 instance."
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID to launch the EC2 instance in."
  type        = string
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
  default = {
    ManagedBy = "Terraform"
  }
}