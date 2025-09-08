resource "cloudflare_zero_trust_access_application" "this" {
  account_id = var.cloudflare_account_id
  name       = "Grafana Cloud"
  allowed_idps = [
    var.cloudflare_zero_trust_access_identity_provider
  ]
  auto_redirect_to_identity    = true
  session_duration             = "6h"
  skip_app_launcher_login_page = false
  type                         = "saas"
  logo_url                     = var.cloudflare_zero_trust_access_application_logo_url

  policies = [
    var.cloudflare_zero_trust_access_policy
  ]

  saas_app {
    app_launcher_url = "https://${var.grafana_stack_url}/login"
    auth_type        = "oidc"
    redirect_uris = [
      "https://${var.grafana_stack_url}/login/generic_oauth"
    ]
    scopes = [
      "openid",
      "profile",
      "email"
    ]
    access_token_lifetime = "5m"
  }
}

resource "grafana_sso_settings" "this" {
  provider_name = "generic_oauth"
  oauth2_settings {
    name          = "Cloudflare Access"
    client_id     = cloudflare_zero_trust_access_application.this.saas_app[0].client_id
    client_secret = cloudflare_zero_trust_access_application.this.saas_app[0].client_secret
    scopes        = "openid profile email"
    auth_url      = "https://${var.cloudflare_access_team_domain}.cloudflareaccess.com/cdn-cgi/access/sso/oidc/${cloudflare_zero_trust_access_application.this.saas_app[0].client_id}/authorization"
    token_url     = "https://${var.cloudflare_access_team_domain}.cloudflareaccess.com/cdn-cgi/access/sso/oidc/${cloudflare_zero_trust_access_application.this.saas_app[0].client_id}/token"
    use_pkce      = true
  }
}
