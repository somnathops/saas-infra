module "vpc" {
  source = "../../modules/vpc"

  vpc_name        = var.vpc_name
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  # nat_gateway_mode = var.nat_gateway_mode
  common_tags = var.common_tags
}

module "security_group" {
  source = "../../modules/security-group"

  security_group_name = var.security_group_name
  vpc_id              = module.vpc.vpc_id
  description         = var.description
  ingress_rules       = var.ingress_rules
  egress_rules        = var.egress_rules
}

module "ec2_role" {
  source = "../../modules/iam"

  name                = "gfti-dev-ec2-role"
  assume_role_service = ["ec2.amazonaws.com"]
  policy_arns = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
    "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
  ]
  create_instance_profile = true
  tags                    = merge(var.common_tags, { "Name" = "gfti-dev-ec2-role" })
}