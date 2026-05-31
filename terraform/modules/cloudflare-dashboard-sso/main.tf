resource "cloudflare_sso_connector" "this" {
  account_id         = var.cloudflare_account_id
  email_domain       = var.dashboard_sso_email_domain
  begin_verification = true
  enabled            = var.dashboard_sso_enabled
}

data "cloudflare_zones" "this" {
  name = var.cloudflare_zone_name
}

# Domain ownership verification for the SSO connector. Cloudflare polls this
# TXT record (the entire cloudflare_dashboard_sso=... string) until verified.
resource "cloudflare_dns_record" "verification" {
  zone_id = data.cloudflare_zones.this.result[0]["id"]
  name    = var.dashboard_sso_email_domain
  type    = "TXT"
  content = cloudflare_sso_connector.this.verification.code
  ttl     = 1
  comment = "Cloudflare dashboard SSO domain verification"
}
