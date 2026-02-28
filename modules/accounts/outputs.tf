output "account_ids" {
  description = "Map of account key to account ID"
  value       = { for k, v in aws_aws_organizations_account.this : k => v.id }
}