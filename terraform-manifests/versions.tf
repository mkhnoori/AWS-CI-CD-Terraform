terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    null = {
      source = "hashicorp/null"

    }
    random = {
      source = "hashicorp/random"

    }
  }
  backend "s3" {}
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  profile = "default"
}
resource "random_pet" "this" {
  length = 2
}