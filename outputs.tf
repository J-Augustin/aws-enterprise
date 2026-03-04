output "organization_id" {
  description = "ID of the AWS Organization"
  value       = module.organization.organization_id
}

output "root_id" {
  description = "ID of the Organization root"
  value       = module.organization.root_id
}

output "organizational_unit_ids" {
  description = "Map of OU name to OU ID"
  value       = module.organization.organizational_unit_ids
}

output "account_ids" {
  description = "Map of account name to account ID"
  value       = module.organization.account_ids
}

output "cloudtrail_bucket_name" {
  description = "Name of the S3 bucket recieving CloudTrail logs"
  value       = module.cloudtrail.bucket_name
}

output "cloudtrail_bucket_arn" {
  description = "ARN of the organization CloudTrail trail"
  value       = module.cloudtrail.bucket_arn
}

output "guardduty_detector_id" {
  description = "GuardDuty detector ID in the security account"
  value       = module.security.guardduty_detector_id
}