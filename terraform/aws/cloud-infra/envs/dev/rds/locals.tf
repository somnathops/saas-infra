locals {
    vpc_id = data.terraform_remote_state.networking.outputs.vpc_id[var.region]
    private_subnet_ids = data.terraform_remote_state.networking.outputs.private_subnet_ids
}