provider "aws" {
  region = "us-east-1"
}

resource "aws_organizations_organization" "org" {
  feature_set = "ALL"

}


provider "aws" {
  alias  = "security"
  region = "us-east-1"


  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.security_tooling.id}:role/OrganizationAccountAccessRole"
  }
}


resource "aws_guardduty_organization_admin_account" "gd-admin" {
  admin_account_id = var.security_account.id
}


resource "aws_securityhub_organization_admin_account" "sh-admin" {
  admin_account_id = var.security_account.id
}


resource "aws_config_organization_admin_account" "config-admin" {
  admin_account_id = var.security_account.id
}


resource "aws_macie_organization_admin_account" "macie-admin" {
  admin_account_id = var.security_account.id
}