terraform {
  backend "s3" {
    bucket         = "polling-terraform-state-vinod"
    key            = "polling-app/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
