terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 6.0"
        }

        tls = {
            source  = "hashicorp/tls"
            version = "~> 4.0"
        }

        random = {
            source  = "hashicorp/random"
            version = "~> 3.5"
        }
    }


    required_version = ">= 1.14.0"
}