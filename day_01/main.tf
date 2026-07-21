resource "random_id" "bucket_id" {
    byte_length = 8
}

resource "aws_s3_bucket" "demobucket" {
    bucket = local.bucket_name
    region = "ap-south-1"
}