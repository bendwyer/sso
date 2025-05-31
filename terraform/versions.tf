terraform {
  required_version = "~> 1.0"

  required_providers {
    auth0 = {
      source = "auth0/auth0"
    }
    aws = {
      source = "hashicorp/aws"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
    onepassword = {
      source = "1Password/onepassword"
    }
  }
}
