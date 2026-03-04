variable "trail_name" {
  description = "Name of the CloudTrail trail"
  type        = string
  default     = "org-trail"
}

variable "bucket_name" {
  description = "Name of the S3 bucket to create for CloudTrail logs"
  type        = string
}