resource "aws_organizations_policy" "this" {
  for_each = var.policies

  name = each.value
  type = "SERVICE_CONTROL_POLICY"
  content = each.value.content
}

resource "aws_organizations_policy_attachment" "this" {
  for_each = {
        for att in var.attachments : "${att.policy_key}-${att.target_id}" => att
    }

policy_id = aws_organizations_policy.this[each.value.policy_key].id
    target_id = each.value.target_id
}

