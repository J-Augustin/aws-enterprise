variable "region" {
  description = "Primary AWS region for deployment"
  type        = string
  default     = "us-east-1"
}

variable "security_account_id" {
  description = "AWS Account ID for the Security OU where security tools will be deployed"
  type        = string
}

variable "log_archive_account_id" {
  description = "AWS Account ID for Log Archive account"
  type        = string
}

variable "organization_name" {
  description = "Name of the AWS Organization"
  type        = string
}