terraform {
  required_version = ">= 1.10.0"

  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}
