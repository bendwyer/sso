terraform {
  required_version = ">= 1.10.0"

  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = ">= 1.20.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.98.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 5.19.1"
    }
  }
}
