data "terraform_remote_state" "networking" {
  backend = "s3"
  config = {
    bucket = "s3-terraform-state-12345"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"
  }
}
