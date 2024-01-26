terraform {
#   cloud {
#     organization = "example-org-f8e12b"
#     workspaces {
#       name = "terra-house-sports"
#     }
#   }
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