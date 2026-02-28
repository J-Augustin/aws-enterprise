output "organization_id" {
  description = "ID of the AWS Organization"
  value       = aws_organizations_organization.this.id
}

output "root_id" {
  description = "ID of the AWS Organization root"
  value       = local.root_id
}

output "organizational_unit_ids" {
  description = "Map of OU names to their IDs"
  value       = { for ou in aws_organizations_organizational_unit.ou : ou.name => ou.id }
}