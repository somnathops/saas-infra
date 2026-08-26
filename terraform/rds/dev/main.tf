module "rds_security-group" {
  source = "../../../modules/security-group"
  vpc_id = local.vpc_id
  description = "Security group for RDS PostgresSQL"
  ingress_rules = []
}

module "rds" {
  source = "../../../modules/rds"

  name = "daily-task-db"

  subnet_ids = local.private_subnet_ids

  security_group_ids = [
    module.rds_security_group.security_group_id
  ]

  # DB config...
}