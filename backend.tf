terraform {
  backend "s3" {
    bucket         = "poorna-terraform-state-bucket-2026-12345"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}