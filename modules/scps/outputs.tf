output "policy_ids" {
  description = "Map of policy key to policy ID"
  value       = { for k, v in aws_aws_organizations_policy.this : k => v.id }
}

