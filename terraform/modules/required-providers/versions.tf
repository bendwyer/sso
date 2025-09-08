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
      version = ">= 4.52.0, < 5.0.0"
      # lots of bugs, downgrading for now
      # version = ">= 5.5.0"
    }
    grafana = {
      source  = "grafana/grafana"
      version = ">= 4.5.3"
    }
    onepassword = {
      source  = "1Password/onepassword"
      version = ">= 2.1.2"
    }
  }
}
