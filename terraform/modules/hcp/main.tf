# Enables SP-initiated login. Hidden in App Launcher.
resource "cloudflare_zero_trust_access_application" "this" {
  account_id = var.cloudflare_account_id
  name       = "HCP"
  allowed_idps = [
    var.cloudflare_zero_trust_access_identity_provider
  ]
  app_launcher_visible         = false
  auto_redirect_to_identity    = true
  session_duration             = "6h"
  skip_app_launcher_login_page = false
  type                         = "saas"
  policies = [
    var.cloudflare_zero_trust_access_policy
  ]

  saas_app {
    # auth_type = "saml"
    consumer_service_url = var.hcp_acs_url
    name_id_format       = "email"
    sp_entity_id         = var.hcp_entity_id
  }
}

# Enables IdP-initiated login. Visible in App Launcher.
# https://support.hashicorp.com/hc/en-us/articles/4404712863379--invalid-request-IdP-Initiated-login-is-not-enabled-error-logging-into-HCP-via-SSO
resource "cloudflare_zero_trust_access_application" "bookmark" {
  account_id = var.cloudflare_account_id
  name       = "HCP"
  type       = "bookmark"
  logo_url   = "https://portal.cloud.hashicorp.com/favicon.ico"
  domain     = "https://portal.cloud.hashicorp.com/sign-in?conn-id=HCP-SSO-${var.hcp_organization_id}-samlp"
}


data "cloudflare_zones" "this" {
  filter {
    name = var.cloudflare_zone_name
  }
}

resource "cloudflare_record" "this" {
  zone_id = data.cloudflare_zones.this.zones[0]["id"]
  name    = data.cloudflare_zones.this.zones[0]["name"]
  content = var.hcp_domain_verification_content
  comment = "HCP"
  type    = "TXT"
}
