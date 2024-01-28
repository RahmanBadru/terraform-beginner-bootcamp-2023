output "bucket_name" {
  description = "Bucket name for our static website"
  value= module.terrahouse_aws.bucket_name
}

output "s3_website_endpoint" {
  description = "S3 Static Website Hosting Endpoint"
  value= module.terrahouse_aws.website_endpoint
}