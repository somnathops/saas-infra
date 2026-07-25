resource "tls_private_key" "generated" {
  algorithm = "RSA"
  rsa_bits  = 4096 
}

resource "aws_key_pair" "generated" {
  key_name   = "terraform-key"
  public_key = tls_private_key.generated.public_key_openssh
}

resource "local_file" "private_key" {
  content         = tls_private_key.generated.private_key_pem
  filename        = "${path.module}/terraform-key.pem"
  file_permission = "0400"
}

resource "aws_security_group" "default" {
  name        = "terraform-security-group"
  description = "Allow SSH inbound traffic"
  vpc_id      = local.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ubuntu_server" {
  ami           = local.ami_id
  instance_type = local.instance_type
  vpc_security_group_ids = local.vpc_security_group_ids
  associate_public_ip_address = local.associate_public_ip_address
  key_name = local.key_name

  tags = {
    Name = "UbuntuServer"
  }
  
}