resource "aws_subnet" "public" {
  for_each                = local.public_subnets
  vpc_id                  = aws_vpc.this.id
  availability_zone       = each.key
  cidr_block              = each.value
  map_public_ip_on_launch = true
  tags = merge(
    local.common_tags, {
      Name = "${var.vpc_name}-public-${each.key}"
    }
  )
}

resource "aws_subnet" "private" {
  for_each = local.private_subnets
  vpc_id = aws_vpc.this.id
  availability_zone = each.key
  cidr_block = each.value
  tags = merge(
    local.common_tags, {
      Name = "${var.vpc_name}-private-${each.key}"
    }
  )
}