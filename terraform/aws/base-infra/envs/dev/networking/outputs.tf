output "vpc_id" {
  value = {
    us-east-1    = module.vpc_use1.vpc_id
    eu-central-1 = module.vpc_euc1.vpc_id
  }
}

output "public_subnet_ids" {
  value = {
    us-east-1    = module.vpc_use1.public_subnet_ids
    eu-central-1 = module.vpc_euc1.public_subnet_ids
  }
}

output "private_subnet_ids" {
  value = {
    us-east-1    = module.vpc_use1.private_subnet_ids
    eu-central-1 = module.vpc_euc1.private_subnet_ids
  }
}
