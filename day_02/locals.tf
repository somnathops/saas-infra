locals {
  ami_id = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  vpc_id = data.aws_vpc.default.id
  vpc_security_group_ids = [aws_security_group.default.id]
  associate_public_ip_address = true
  key_name = aws_key_pair.generated.key_name
}
