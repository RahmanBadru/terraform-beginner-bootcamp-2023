terraform {
  cloud {
    organization = "example-org-f8e12b"
    workspaces {
      name = "terra-house-sports"
    }
  }
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.6.0"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.32.1"
    }
  }
}

provider "random" {
  # Configuration options
}

provider "aws" {
  # Configuration options
}

#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket" "example" {
  #Bucket naming
  # https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html?icmpid=docs_amazons3_console
  bucket = random_string.bucket_name.result
}

resource "random_string" "bucket_name" {
  length = 32
  special = false
  lower = true
  upper = false
}

output "random_bucket_name" {
    value = random_string.bucket_name.result
}
