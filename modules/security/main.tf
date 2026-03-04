######################################################################
# Management account: delegate security services to security tooling account
########################################################################

resource "aws_guardduty_organization_admin_account" "this" {
  admin_account_id = var.security_account_id
}

resource "aws_securityhub_organization_admin_account" "this" {
  admin_account_id = var.security_account_id
}

resource "aws_config_organization_admin_account" "this" {
  admin_account_id = var.security_account_id
}

resource "aws_macie_organization_admin_account" "this" {
  admin_account_id = var.security_account_id
}

######################################################################
# Security tooling account: configure security services
######################################################################

resource "aws_guardduty_detector" "this" {
  provider = aws.security
  enable   = true
}

resource "aws_guardduty_organization_configuration" "this" {
  provider                         = aws.security
  detector_id                      = aws_guardduty_detector.this.id
  auto_enable_organization_members = "ALL"
}

resource "aws_securityhub_account" "this" {
  provider = aws.security
}

resource "aws_securityhub_organization_configuration" "this" {
  provider    = aws.security
  auto_enable = true

  depends_on = [aws_securityhub_account.this]
}

resource "aws_iam_role" "config_aggregator" {
  provider = aws.security
  name     = "config-aggregator-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Action    = "sts:AssumeRole"
        Principal = { Service = "config.amazonaws.com" }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "config_aggregator" {
  provider   = aws.security
  role       = aws_iam_role.config_aggregator.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRoleForOrganizations"
}

resource "aws_config_configuration_aggregator" "this" {
  provider = aws.security
  name     = "org-aggregator"

  organization_aggregation_source {
    role_arn    = aws_iam_role.config_aggregator.arn
    all_regions = true
  }

  depends_on = [aws_iam_role_policy_attachment.config_aggregator]
}