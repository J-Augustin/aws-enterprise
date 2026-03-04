variable "region" {
  description = "Primary AWS region for deployment"
  type        = string
  default     = "us-east-1"
}

variable "security_account_id" {
  description = "AWS Account ID for the Security OU where security tools will be deployed"
  type        = string
}
