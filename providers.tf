terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.36.0, <5.48.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.2"
    }

  }
  required_version = "~>1.8.0"
}

provider "aws" {
  region = "us-east-1"
  secret_key = var.secret_key
  access_key = var.access_key
  default_tags {
    tags = var.tags
  }
}

