terraform{
    backend "s3" {
        bucket = "s3-terraform-state-12345"
        key    = "day_01/terraform.tfstate"
        region = "ap-south-1"
        use_lockfile = true
    }
}