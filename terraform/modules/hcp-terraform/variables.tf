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

variable "hcp_terraform_acs_url" {
  description = "SAML Assertion Consumer Service (ACS) url."
  type        = string
}

variable "hcp_terraform_entity_id" {
  description = "SAML Entity ID. Can also be called Issuer URL or Audience."
  type        = string
}
