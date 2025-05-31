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
  default     = "https://tailscale.com/favicon.ico"
  description = "URL pointing to a file to use as the application logo."
  type        = string
}
