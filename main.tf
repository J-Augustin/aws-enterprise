module "organization" {
  source = "./modules/organization"

  organizational_units = ["Security", "Infrastructure", "Workloads", "Sandbox"]
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

module "scps" {
  source = "./modules/scps"

  policies = {
    deny_root = {
      name    = "DenyRootUsage"
      content = file("${path.module}/scps/deny-root.json")
    }
  }

  attachments = [
    {
      policy_key = "deny_root"
      target_id  = module.organization.organizational_unit_ids["Workloads"]
    }
  ]
}

module "cloudtrail" {
  source = "./modules/cloudtrail"

  trail_name  = "org-trail"
  bucket_name = "fun-factory-cloudtrail-logs"
}

module "security" {
  source = "./modules/security"

  providers = {
    aws          = aws
    aws.security = aws.security
  }

  security_account_id = var.security_account_id
}