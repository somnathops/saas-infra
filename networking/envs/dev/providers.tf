provider "aws" {
  alias  = "use1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "euc1"
  region = "eu-central-1"
}

provider "aws" {
  alias  = "aps1"
  region = "ap-south-1"
}