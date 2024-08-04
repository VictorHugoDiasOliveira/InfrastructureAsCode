terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.2.3"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
  token = var.github_token
}