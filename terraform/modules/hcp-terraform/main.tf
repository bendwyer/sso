resource "cloudflare_zero_trust_access_application" "this" {
  account_id = var.cloudflare_account_id
  name       = "HCP Terraform"
  allowed_idps = [
    var.cloudflare_zero_trust_access_identity_provider
  ]
  auto_redirect_to_identity = true
  session_duration          = "6h"
  type                      = "saas"
  logo_url                  = "https://app.terraform.io/favicon.ico"

  policies = [
    {
      id         = var.cloudflare_zero_trust_access_policy
      precedence = 1
    }
  ]

  saas_app = {
    consumer_service_url = var.hcp_terraform_acs_url
    name_id_format       = "email"
    sp_entity_id         = var.hcp_terraform_entity_id
  }
}
