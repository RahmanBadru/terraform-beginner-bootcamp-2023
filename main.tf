terraform {
#   cloud {
#     organization = "example-org-f8e12b"
#     workspaces {
#       name = "terra-house-sports"
#     }
#   }
}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
}