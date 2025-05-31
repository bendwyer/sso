terraform {
  required_version = ">= 1.10.0"

  required_providers {
    auth0 = {
      source = "auth0/auth0"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}
