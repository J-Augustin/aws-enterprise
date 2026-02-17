terraform {
  backend "s3" {
    bucket         = "org-terraform-state"
    key            = "landing-zone/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}