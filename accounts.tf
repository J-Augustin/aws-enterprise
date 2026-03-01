##################################################################################
# GuardDuty, Security Hub, Config, and Macie enabled org wide
#################################################################################

resource "aws_guardduty_detector" "main" {
  provider = aws.security
  enable   = true
}

resource "aws_guardduty_organization_configuration" "org" {
  provider                         = aws.security
  detector_id                      = aws_guardduty_detector.main.id
  auto_enable_organization_members = true
}

resource "aws_securityhub_account" "main" {
  provider = aws.security
}

resource "aws_securityhub_organization_configuration" "org" {
  provider    = aws.security
  auto_enable = true
}

resource "aws_config_configuration_aggregator" "org" {
  provider = aws.security
  name     = "org-aggregator"

  organization_aggregation_source {
    all_regions = true
    role_arn    = aws_iam_role.config_aggregator.arn
  }
}