terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "ssverchkov-cloud-infrastructure-tfstate-prod"
    key    = "ssverchkov/corporate-website-demo/terraform.tfstate"
    region = "eu-central-1"
  }
}