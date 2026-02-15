provider "aws" {
  region = "us-east-1"
}

resource "aws_organizations_organization" "org" {
  feature_set = "ALL"

}