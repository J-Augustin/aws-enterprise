module "organization" {
  source = "./modules/organization"

  organizational_units = [ "Security", "Infrastructure", "Workloads", "Sandbox"]
}

module "accounts" {
  source = "./modules/accounts"

  accounts = {
    log_archive = {
      name      = "log-archive"
      email     = "log-archive@fun-factory.com"
      parent_id = module.organization.organizational_unit_ids["Security"]
    }
    security_tooling = {
      name      = "security-tooling"
      email     = "security-tooling@fun-factory.com"
      parent_id = module.organization.organizational_unit_ids["Security"]
    }
    network = {
      name      = "network"
      email     = "network@fun-factory.com"
      parent_id = module.organization.organizational_unit_ids["Infrastructure"]
    }
    shared_services = {
      name      = "shared-services"
      email     = "shared-services@fun-factory.com"
      parent_id = module.organization.organizational_unit_ids["Workloads"]
    }
     dev = {
      name      = "dev"
      email     = "dev@fun-factory.com"
      parent_id = module.organization.organizational_unit_ids["Workloads"]
    }
    prod = {
      name      = "prod"
      email     = "prod@fun-factory.com"
      parent_id = module.organization.organizational_unit_ids["Workloads"]
    }
    staging = {
      name      = "staging"
      email     = "staging@fun-factory.com"
      parent_id = module.organization.organizational_unit_ids["Workloads"]
    }
     sandbox = {
      name      = "sandbox"
      email     = "sandbox@fun-factory.com"
      parent_id = module.organization.organizational_unit_ids["Sandbox"]
    }

  }
}

resource "aws_cloudtrail" "org_trail" {
  name                          = "org-trail"
  s3_bucket_name                = aws_s3_bucket.log_bucket.id
  is_organization_trail         = true
  enable_log_file_validation    = true
  include_global_service_events = true
}