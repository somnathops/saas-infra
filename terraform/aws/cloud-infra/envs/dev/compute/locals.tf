locals {
  vpc_id         = data.terraform_remote_state.networking.outputs.vpc_id[var.region]
  available_azs  = data.aws_availability_zones.available.names
  region_subnets = data.terraform_remote_state.networking.outputs.subnet_ids[var.region]
  selected_az    = local.available_azs[random_integer.az.result]
  subnet_id      = local.region_subnets[local.selected_az]
}