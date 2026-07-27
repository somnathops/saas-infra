resource "aws_nat_gateway" "ngw" {
    for_each = local.nat_gateway_subnets
    allocation_id = aws_eip.nat[each.key].id
    subnet_id = aws_subnet.public[each.key].id
    depends_on = [ aws_internet_gateway.this ]
    tags = merge(
        local.common_tags,
        {
            Name = "${var.vpc_name}-nat-gw-${each.key}"
        }
    )
  
}