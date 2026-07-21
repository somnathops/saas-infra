terraform{
    backend "s3" {
        bucket = "s3-terraform-state-12345"
        key    = "key/terraform.tfstate"
        use_lockfile = true
    }
}