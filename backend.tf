
terraform {
  backend "s3" {
    bucket         = "pravin-terraform-state-2026"
    key            = "vpc/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
}
