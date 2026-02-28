resource "aws_organizations_policy" "deny_root" {
  name    = "DenyRootUsage"
  type    = "SERVICE_CONTROL_POLICY"
  content = file("${path.module}/scps/deny-root.json")
}

resource "aws_organizations_policy_attachment" "deny_root_workloads" {
  policy_id = aws_organizations_policy.deny_root.id
  target_id = module.organization.organizational_unit_ids["Workloads"]
}