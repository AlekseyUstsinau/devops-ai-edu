output "bucket_name" {
  description = "Name of the S3 bucket created for application artifacts."
  value       = aws_s3_bucket.this.bucket
}

output "bucket_arn" {
  description = "ARN of the application artifacts S3 bucket."
  value       = aws_s3_bucket.this.arn
}
