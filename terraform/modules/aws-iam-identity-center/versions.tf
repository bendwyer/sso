terraform {

  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.MANAGEMENT]
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}
