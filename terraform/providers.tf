provider "auth0" {
  client_id     = data.onepassword_item.auth0.username
  client_secret = data.onepassword_item.auth0.credential
  domain        = var.auth0_domain
}

provider "aws" {
  alias  = "MANAGEMENT"
  region = var.aws_region
}

provider "cloudflare" {
  api_token = data.onepassword_item.cloudflare.credential
}

provider "onepassword" {}
