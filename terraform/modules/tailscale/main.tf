resource "cloudflare_zero_trust_access_application" "this" {
  account_id = var.cloudflare_account_id
  name       = "Tailscale"
  allowed_idps = [
    var.cloudflare_zero_trust_access_identity_provider
  ]
  auto_redirect_to_identity = true
  session_duration          = "6h"
  type                      = "saas"
  logo_url                  = var.cloudflare_zero_trust_access_application_logo_url

  policies = [
    {
      id         = var.cloudflare_zero_trust_access_policy
      precedence = 1
    }
  ]

  saas_app = {
    app_launcher_url = "https://login.tailscale.com"
    auth_type        = "oidc"
    grant_types      = ["authorization_code"]
    redirect_uris = [
      "https://login.tailscale.com/a/oauth_response"
    ]
    scopes                = ["openid", "profile", "email"]
    access_token_lifetime = "5m"
  }
}
