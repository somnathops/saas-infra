# resource "aws_eip" "nat" {
#   for_each = local.nat_gateway_subnets
#   domain = "vpc"

#   tags = merge(
#     local.common_tags,
#     {
#       Name = "${var.vpc_name}-nat-eip-${each.key}"
#     }
#   )
# }