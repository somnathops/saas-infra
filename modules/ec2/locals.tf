locals {
  instance_name = "tenant-${var.tenant_id}"
  tags = merge(var.tags,
    {
      Name = local.instance_name
      tenant_id = var.tenant_id
    }
  )

  
}