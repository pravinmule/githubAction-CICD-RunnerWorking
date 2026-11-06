
terraform {
  backend "s3" {
    bucket         = "amznpravinbhai232323"
    key            = "vpc/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
}
