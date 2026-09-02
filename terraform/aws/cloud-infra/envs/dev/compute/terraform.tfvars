region                      = "eu-central-1"
key_name                    = "platform-admin"
associate_public_ip_address = true
root_block_device = {
  volume_size           = 30
  volume_type           = "gp2"
  delete_on_termination = true
}