regions = {
  us-east-1 = {
    vpc_name      = "dev-use1"
    vpc_cidr      = "10.0.0.0/16"
    subnet_prefix = 24
  }

  eu-central-1 = {
    vpc_name      = "dev-euc1"
    vpc_cidr      = "10.1.0.0/16"
    subnet_prefix = 24
  }
}

common_tags = {
  Environment = "dev"
}