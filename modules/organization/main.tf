resource "aws_organizations_organization" "this" {
  feature_set = var.feature_set
}

locals {
  root_id = aws_organizations_organization.this.roots[0].id
}

resource "aws_organizations_organizational_unit" "ou" {
  for_each = toset(var.organizational_units)

  name      = each.value
  parent_id = local.root_id
} 