variable "cloudflare_account_id" {
  description = "Cloudflare account id."
  type        = string
}

variable "cloudflare_access_policy_allow_domains" {
  description = "Email domains to allow in policies."
  type        = list(string)
}

variable "cloudflare_access_team_domain" {
  description = "Cloudflare Access team domain. Sets the URL where App Launcher can be accessed."
  type        = string
}
