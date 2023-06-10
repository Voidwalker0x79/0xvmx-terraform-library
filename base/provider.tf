terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.2.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  shared_credentials_files = ["~/.aws/credentials"]
  profile = "default"
}

data "aws_caller_identity" "current" {}

output "user_arn" {
  value = data.aws_caller_identity.current.arn
}
