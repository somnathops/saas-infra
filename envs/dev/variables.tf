variable "regions" {
  description = "List of AWS regions to deploy resources in"
  type = map(object({
    vpc_name      = string
    vpc_cidr      = string
    subnet_prefix = number
  }))
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default = {
    Environment = "dev"
  }
}