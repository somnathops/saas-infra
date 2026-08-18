module "security_group" {
  source      = "../../../modules/security-group"
  description = "Security group for dev environment"
  vpc_id      = local.vpc_id

  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_ipv4 = ["122.168.71.80/32"]
    },
  ]
}

resource "random_integer" "az" {
  min = 0
  max = length(local.available_azs) - 1
}

module "ec2" {
  source                      = "../../../modules/ec2"
  ami_id                      = data.aws_ami.ubuntu.id
  subnet_id                   = local.subnet_id
  instance_type               = var.instance_type
  security_group_ids          = [module.security_group.security_group_id]
  key_name                    = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  tags                        = var.tags
}