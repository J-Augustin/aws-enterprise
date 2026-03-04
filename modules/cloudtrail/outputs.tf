output "trail_arn" {
  description = "ARN of the CloudTrail trail"
  value       = aws_cloudtrail.this.arn
}

output "bucket_name" {
  description = "Name of the S3 log bucket"
  value       = aws_s3_bucket.this.bucket
}

