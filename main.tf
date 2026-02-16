resource "aws_cloudtrail" "org_trail" {
  name                          = "org-trail"
  s3_bucket_name                = aws_s3_bucket.log_bucket.id
  is_organization_trail         = true
  enable_log_file_validation    = true
  include_global_service_events = true
}