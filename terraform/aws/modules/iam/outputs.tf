output "role_arn" {
    description = "ARN of the IAM role."
    value = aws_iam_role.this.arn
}

output "instance_profile_name" {
    description = "Name of the IAM Instance Profile."
    value = var.create_instance_profile ? aws_iam_instance_profile.this[0].name : null
}

output "role_name" {
    description = "Name of the IAM role."
    value = aws_iam_role.this.name
}