resource "auth0_client" "this" {
  name        = "Cloudflare Zero Trust"
  description = "IdP for Cloudflare Zero Trust"
  app_type    = "regular_web"
  callbacks = [
    "https://${var.cloudflare_access_team_domain}.cloudflareaccess.com/cdn-cgi/access/callback"
  ]
  grant_types = [
    "authorization_code",
  ]
  jwt_configuration {
    secret_encoded = false
    alg            = "RS256"
  }
}

resource "auth0_client_credentials" "this" {
  client_id             = auth0_client.this.client_id
  authentication_method = "client_secret_post"
}

data "auth0_client" "this" {
  client_id = auth0_client.this.client_id
}

data "auth0_tenant" "this" {}

resource "cloudflare_zero_trust_access_identity_provider" "this" {
  account_id = var.cloudflare_account_id
  name       = "Auth0"
  type       = "oidc"

  config {
    client_id        = data.auth0_client.this.client_id
    client_secret    = data.auth0_client.this.client_secret
    auth_url         = "https://${data.auth0_tenant.this.domain}/authorize"
    token_url        = "https://${data.auth0_tenant.this.domain}/oauth/token"
    certs_url        = "https://${data.auth0_tenant.this.domain}/.well-known/jwks.json"
    pkce_enabled     = true
    email_claim_name = "email"
    scopes = [
      "openid",
      "email",
      "profile"
    ]
    support_groups = false
  }
}

resource "cloudflare_zero_trust_access_policy" "app_launcher" {
  account_id = var.cloudflare_account_id
  name       = "app-launcher"
  decision   = "allow"

  include {
    email_domain = var.cloudflare_access_policy_allow_domains
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "cloudflare_zero_trust_access_policy" "private_applications" {
  account_id = var.cloudflare_account_id
  name       = "private-applications"
  decision   = "allow"

  include {
    email_domain = var.cloudflare_access_policy_allow_domains
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "cloudflare_zero_trust_access_policy" "shared_applications" {
  account_id = var.cloudflare_account_id
  name       = "shared-applications"
  decision   = "allow"

  include {
    email_domain = var.cloudflare_access_policy_allow_domains
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "cloudflare_zero_trust_access_organization" "this" {
  account_id  = var.cloudflare_account_id
  name        = "${var.cloudflare_access_team_domain}.cloudflareaccess.com"
  auth_domain = "${var.cloudflare_access_team_domain}.cloudflareaccess.com"

  custom_pages {}

  login_design {}

  lifecycle {
    prevent_destroy = true
  }
}

# App Launcher
resource "cloudflare_zero_trust_access_application" "this" {
  account_id           = var.cloudflare_account_id
  app_launcher_visible = false
  allowed_idps = [
    cloudflare_zero_trust_access_identity_provider.this.id
  ]
  auto_redirect_to_identity    = true
  session_duration             = "6h"
  skip_app_launcher_login_page = false
  type                         = "app_launcher"
  policies = [
    cloudflare_zero_trust_access_policy.app_launcher.id
  ]

  lifecycle {
    prevent_destroy = true
  }
}
