# Configure Terraform
terraform {
  cloud {
    organization = "VictorOliveira"
    workspaces {
      tags = [
        "aws",
        "rds",
        "dev"
      ]
    }
  }
  required_version = ">= 1.2.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.22"
    }
  }
}

# configuration for aws provider
provider "aws" {
  region  = var.aws_region
  profile = "victoroliveira_${var.environment}"
  default_tags {
    tags = {
      "Environment"         = var.environment
      "Terraform"           = "true"
      "Terraform Directory" = "rds"
      "Terraform Workspace" = terraform.workspace
    }
  }
}

