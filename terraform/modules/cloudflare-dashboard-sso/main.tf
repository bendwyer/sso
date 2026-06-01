resource "cloudflare_sso_connector" "this" {
  account_id         = var.cloudflare_account_id
  email_domain       = var.dashboard_sso_email_domain
  begin_verification = true
  enabled            = var.dashboard_sso_enabled
}

data "cloudflare_zones" "this" {
  name = var.cloudflare_zone_name
}

# Domain verification TXT record polled by Cloudflare until verified.
resource "cloudflare_dns_record" "verification" {
  zone_id = data.cloudflare_zones.this.result[0]["id"]
  name    = var.dashboard_sso_email_domain
  type    = "TXT"
  content = cloudflare_sso_connector.this.verification.code
  ttl     = 1
  comment = "Cloudflare dashboard SSO domain verification"
}

# Imported dash_sso app. Its launcher tile = IdP-initiated dashboard login.
# Pins the allow-email-domain policy -- dropping it locks admins out.
resource "cloudflare_zero_trust_access_application" "dashboard_sso" {
  account_id                = var.cloudflare_account_id
  name                      = "Cloudflare"
  type                      = "dash_sso"
  logo_url                  = "https://www.cloudflare.com/favicon.ico"
  auto_redirect_to_identity = false
  session_duration          = "24h"
  allowed_idps              = []

  policies = [
    {
      id         = var.dashboard_sso_policy_id
      precedence = 1
    }
  ]

  saas_app = {
    consumer_service_url = "https://dash.cloudflare.com/api/v4/saml/acs"
    sp_entity_id         = "dash.cloudflare.com"
    name_id_format       = "id"
  }

  lifecycle {
    prevent_destroy = true
    # Not settable on dash_sso (defaults true); without this, apply nulls it.
    ignore_changes = [app_launcher_visible]
  }
}
