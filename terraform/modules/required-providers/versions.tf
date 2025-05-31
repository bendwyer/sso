terraform {
  required_providers {
    auth0 = {
      source  = "auth0/auth0"
      version = "1.20.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.98.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.52.0"
      # lots of bugs, downgrading for now
      # version = "5.5.0"
    }
  }
}
