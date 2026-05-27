resource "cloudflare_zero_trust_access_application" "this" {
  account_id = var.cloudflare_account_id
  name       = "HCP Terraform"
  allowed_idps = [
    var.cloudflare_zero_trust_access_identity_provider
  ]
  auto_redirect_to_identity    = true
  session_duration             = "6h"
  skip_app_launcher_login_page = false
  type                         = "saas"
  logo_url                     = "https://app.terraform.io/favicon.ico"

  policies = [
    var.cloudflare_zero_trust_access_policy
  ]

  saas_app {
    # auth_type = "saml"
    consumer_service_url = var.hcp_terraform_acs_url
    name_id_format       = "email"
    sp_entity_id         = var.hcp_terraform_entity_id
  }
}
