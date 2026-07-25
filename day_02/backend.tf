terraform{
    backend "s3" {
        bucket = "s3-terraform-state-12345"
        key    = "day_02/terraform.tfstate"
        use_lockfile = true
        region = "ap-south-1"
    }
}