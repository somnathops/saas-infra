locals {
  common_tags = merge(
    var.common_tags,
    {
      managedBy = "terraform"
    }
  )

  azs     = data.aws_availability_zones.available.names
  newbits = var.subnet_prefix - tonumber(split("/", var.vpc_cidr)[1])
  public_subnets = {
    for index, az in local.azs :
    az => cidrsubnet(var.vpc_cidr, local.newbits, index)
  }

}