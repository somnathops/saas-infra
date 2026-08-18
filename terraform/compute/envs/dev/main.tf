module "security_group" {
  source = "../../../modules/security-group"
  description = "Security group for dev environment"
  vpc_id = local.vpc_id

  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["122.168.71.80/32"]
    },
  ]
}

resource "random_integer" "az" {
  min = 0
  max = length(local.available_azs) - 1
}

resource "random_id" "tenant_id" {
  byte_length = 4
}

module "ec2_instance" {
  source = "../../../modules/ec2-instance"
  ami_id                     = data.aws_ami.ubuntu.id
  tenant_id                  = random_id.tenant_id.hex
  subnet_id                  = local.subnet_id
  instance_type              = var.instance_type
  security_group_ids         = [module.security_group.security_group_id]
  key_name                   = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  tags                       = merge(var.tags, 
                              { "Name" = "tenant-${random_id.tenant_id.hex}"
                                "ManagedBy" = "Terraform" 
                              })
}