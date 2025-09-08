variable "cloudflare_access_team_domain" {
  description = "Cloudflare Access team domain. Sets the URL where App Launcher can be accessed."
  type        = string
}

variable "cloudflare_account_id" {
  description = "Cloudflare account id."
  type        = string
}

variable "cloudflare_zero_trust_access_identity_provider" {
  description = "Name of IdP for Cloudflare Zero Trust Access."
  type        = string
}

variable "cloudflare_zero_trust_access_policy" {
  description = "Policy to grant access to applications."
  type        = string
}

variable "cloudflare_zero_trust_access_application_logo_url" {
  default     = "https://grafana.com/favicon.ico"
  description = "URL pointing to a file to use as the application logo."
  type        = string
}

variable "grafana_stack_url" {
  description = "URL of Grafana Stack."
  type        = string
}
