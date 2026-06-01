variable "cloudflare_account_id" {
  description = "Cloudflare account id."
  type        = string
}

variable "cloudflare_zero_trust_access_identity_provider" {
  description = "Name of IdP for Cloudflare Zero Trust Access."
  type        = string
}

variable "cloudflare_zone_name" {
  description = "Cloudflare zone hosting the DNS for the SSO email domain."
  type        = string
}

variable "dashboard_sso_email_domain" {
  description = "Email domain to enforce Cloudflare dashboard SSO for."
  type        = string
}

variable "dashboard_sso_enabled" {
  description = "Whether to enforce dashboard SSO. Enable only after domain verification has succeeded."
  type        = bool
  default     = false
}

variable "dashboard_sso_policy_id" {
  description = "ID of the connector-generated allow-email-domain policy attached to the dash_sso app."
  type        = string
}
