module "auth0_dashboard" {
  source = "./modules/cloudflare-access-bookmark"

  bookmark_name         = "Auth0"
  bookmark_logo_url     = "https://cdn.auth0.com/website/website/favicons/auth0-favicon.svg"
  bookmark_url          = "https://auth0.com/api/auth/login?redirectTo=dashboard"
  cloudflare_account_id = var.cloudflare_account_id
}

module "cloudflare" {
  source = "./modules/cloudflare-access-bookmark"

  bookmark_name         = "Cloudflare"
  bookmark_logo_url     = "https://www.cloudflare.com/favicon.ico"
  bookmark_url          = "https://dash.cloudflare.com/login"
  cloudflare_account_id = var.cloudflare_account_id
}

module "github" {
  source = "./modules/cloudflare-access-bookmark"

  bookmark_name         = "GitHub"
  bookmark_logo_url     = "https://github.com/favicon.ico"
  bookmark_url          = "https://github.com/login"
  cloudflare_account_id = var.cloudflare_account_id
}

module "nextdns" {
  source = "./modules/cloudflare-access-bookmark"

  bookmark_name         = "NextDNS"
  bookmark_logo_url     = "https://my.nextdns.io/favicon.ico"
  bookmark_url          = "https://my.nextdns.io/login"
  cloudflare_account_id = var.cloudflare_account_id
}
