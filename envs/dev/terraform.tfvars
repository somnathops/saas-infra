vpc_name = "dev-vpc"
vpc_cidr = "172.0.0.0/16"

public_subnets = {
  "public-subnet-A" = {
    cidr = "172.0.1.0/24"
  }
  "public-subnet-B" = {
    cidr = "172.0.2.0/24"
  }
}

private_subnets = {
  "private-subnet-A" = {
    cidr = "172.0.11.0/24"
  }
  "private-subnet-B" = {
    cidr = "172.0.12.0/24"
  }
}

common_tags = {
  Environment = "dev"
}
# nat_gateway_mode = "single"