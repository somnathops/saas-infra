locals {
  common_tags = merge(
    var.common_tags,
    {
        managedBy = "terraform"
    }
  )
}

locals {
  azs = data.aws_availability_zones.available.names

  public_subnet_keys = sort(keys(var.public_subnets))

  public_subnet_az_map = zipmap(
    local.public_subnet_keys,
    slice(local.azs, 0, length(local.public_subnet_keys))
  )

  private_subnet_keys = sort(keys(var.private_subnets))

  private_subnet_az_map = zipmap(
    local.private_subnet_keys,
    slice(local.azs, 0, length(local.private_subnet_keys))
  )

  nat_gateway_subnets = var.nat_gateway_mode == "single" ? {
    (local.public_subnet_keys[0]) = var.public_subnets[local.public_subnet_keys[0]]
  } : var.public_subnets
}