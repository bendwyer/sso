module "required_providers" {
  source = "./modules/required-providers"
}

module "auth0" {
  source = "./modules/auth0"
}

module "cloudflare_access" {
  source = "./modules/cloudflare-access"

  cloudflare_access_policy_allow_domains = var.cloudflare_access_policy_allow_domains
  cloudflare_access_team_domain          = var.cloudflare_access_team_domain
  cloudflare_account_id                  = var.cloudflare_account_id
}
