output "ec2_instance_id" {
  value = aws_instance.ubuntu_server.id
}
output "ec2_instance_public_ip" {
  value = aws_instance.ubuntu_server.public_ip
}