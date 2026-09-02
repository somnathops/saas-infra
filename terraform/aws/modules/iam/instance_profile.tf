resource "aws_iam_instance_profile" "this" {
    count = var.create_instance_profile ? 1 : 0
    name = var.name
    role = aws_iam_role.this.name
}