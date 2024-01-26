
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket" "example" {
  #Bucket naming
  # https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html?icmpid=docs_amazons3_console
  bucket = random_string.bucket_name.result
  tags = {
    UserUuid = var.user_uuid
  }
}

resource "random_string" "bucket_name" {
  length = 32
  special = false
  lower = true
  upper = false
}
