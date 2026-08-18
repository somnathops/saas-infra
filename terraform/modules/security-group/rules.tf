resource "aws_vpc_security_group_ingress_rule" "this"{
    for_each = {
        for idx,rule in var.ingress_rules :
        idx => rule
    }
    security_group_id = aws_security_group.this.id
    from_port         = each.value.from_port
    to_port           = each.value.to_port
    ip_protocol       = each.value.protocol
    cidr_ipv4         = try(each.value.cidr_ipv4, null)
    description       = try(each.value.description, null)
    referenced_security_group_id = try(each.value.referenced_security_group_id, null)
}

resource "aws_vpc_security_group_egress_rule" "this"{
    for_each = {
        for idx,rule in var.egress_rules :
        idx => rule
    }
    security_group_id = aws_security_group.this.id
    from_port         = each.value.from_port
    to_port           = each.value.to_port
    ip_protocol       = each.value.protocol
    cidr_ipv4         = try(each.value.cidr_ipv4, null)
    description       = try(each.value.description, null)
    referenced_security_group_id = try(each.value.referenced_security_group_id, null)
}