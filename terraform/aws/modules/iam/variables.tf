variable "name" {
    description = "The name of the IAM role."
    type        = string 
}

variable "assume_role_service" {
    description = "The service that can assume the IAM role."
    type        = list(string)
}

variable "policy_arns" {
    description = "A list of managed policy ARNs to attach to the IAM role."
    type        = list(string)
    default     = []
}

variable "tags" {
    description = "A map of tags to assign to the IAM role."
    type        = map(string)
    default     = {}
}
variable "create_instance_profile" {
    description = "Whether to create an IAM instance profile for the role."
    type        = bool
    default     = true
}