resource "cloudflare_zero_trust_access_application" "this" {
  account_id = var.cloudflare_account_id
  name       = "Omni"
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
    app_launcher_url = "https://${var.omni_url}"
    auth_type        = "oidc"
    redirect_uris = [
      "https://${var.omni_url}/oidc/consume"
    ]
    scopes = [
      "openid",
      "profile",
      "email"
    ]
    custom_claim {
      name     = "email_verified"
      scope    = "profile"
      required = false

      source {
        name = "email_verified"
      }
    }
    access_token_lifetime = "5m"
  }
}
