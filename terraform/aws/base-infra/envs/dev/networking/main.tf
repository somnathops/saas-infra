module "vpc_use1" {
  providers = {
    aws = aws.use1
  }

  source = "../../../../modules/vpc"

  vpc_name      = var.regions["us-east-1"].vpc_name
  vpc_cidr      = var.regions["us-east-1"].vpc_cidr
  subnet_prefix = var.regions["us-east-1"].subnet_prefix

  common_tags = var.common_tags
}

module "vpc_euc1" {
  providers = {
    aws = aws.euc1
  }

  source = "../../../../modules/vpc"

  vpc_name      = var.regions["eu-central-1"].vpc_name
  vpc_cidr      = var.regions["eu-central-1"].vpc_cidr
  subnet_prefix = var.regions["eu-central-1"].subnet_prefix

  common_tags = var.common_tags
}