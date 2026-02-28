resource "aws_guardduty_organization_admin_account" "gd_admin" {
  admin_account_id = var.security_account_id
}

resource "aws_securityhub_organization_admin_account" "sh_admin" {
  admin_account_id = var.security_account_id
}

resource "aws_config_organization_admin_account" "config_admin" {
  admin_account_id = var.security_account_id
}

resource "aws_macie_organization_admin_account" "macie_admin" {
  admin_account_id = var.security_account_id
}
