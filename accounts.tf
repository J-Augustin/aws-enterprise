resource "aws_organizations_account" "log_archive" {
  name      = "log-archive"
  email     = "log-archive@fun-factory.com"
  parent_id = aws_organizations_organizational_unit.security.id
}


resource "aws_organizations_account" "security_tooling" {
  name      = "security-tooling"
  email     = "security-tooling@fun-factory.com"
  parent_id = aws_organizations_organizational_unit.security.id
}


resource "aws_organizations_account" "network" {
  name      = "network"
  email     = "network@fun-factory.com"
  parent_id = aws_organizations_organizational_unit.infrastructure.id
}


resource "aws_organizations_account" "shared_services" {
  name      = "shared-services"
  email     = "shared-services@fun-factory.com"
  parent_id = aws_organizations_organizational_unit.workloads.id
}

resource "aws_organizations_account" "dev" {
  name      = "dev"
  email     = "dev@fun-factory.com"
  parent_id = aws_organizations_organizational_unit.workloads.id
}


resource "aws_organizations_account" "prod" {
  name      = "prod"
  email     = "prod@fun-factory.com"
  parent_id = aws_organizations_organizational_unit.workloads.id
}


resource "aws_organizations_account" "staging" {
  name      = "staging"
  email     = "staging@fun-factory.com"
  parent_id = aws_organizations_organizational_unit.workloads.id
}


resource "aws_organizations_account" "sandbox" {
  name      = "sandbox"
  email     = "sandbox@fun-factory.com"
  parent_id = aws_organizations_organizational_unit.sandbox.id
}
