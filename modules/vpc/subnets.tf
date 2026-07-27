resource "aws_subnet" "public" {
    for_each = var.public_subnets
    vpc_id = aws_vpc.this.id
    cidr_block = each.value.cidr
    map_public_ip_on_launch = true
    availability_zone = local.public_subnet_az_map[each.key]
    tags = merge(
        local.common_tags,
        {
            Name = "${var.vpc_name}-public-${each.key}"
        })
}

resource "aws_subnet" "private" {
    for_each = var.private_subnets
    vpc_id = aws_vpc.this.id
    cidr_block = each.value.cidr
    availability_zone = local.private_subnet_az_map[each.key]
    tags = merge(
        local.common_tags,
        {
            Name = "${var.vpc_name}-private-${each.key}"
        })
}