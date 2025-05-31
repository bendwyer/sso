provider "auth0" {
  client_id     = var.auth0_client_id
  client_secret = var.auth0_client_secret
  domain        = var.auth0_domain
}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region

  assume_role {
    role_arn     = var.aws_assume_role_arn
    session_name = var.aws_assume_role_session_name
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}
