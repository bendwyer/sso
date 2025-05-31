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

variable "cloudflare_zone_name" {
  description = "Cloudflare zone name."
  type        = string
}

variable "hcp_acs_url" {
  description = "SAML Assertion Consumer Service (ACS) url."
  type        = string
}

variable "hcp_domain_verification_content" {
  description = "TXT record content. Domain verification is a pre-requisite for HCP SSO."
  type        = string
}

variable "hcp_entity_id" {
  description = "SAML Entity ID. Can also be called Issuer URL or Audience."
  type        = string
}

variable "hcp_organization_id" {
  description = "HCP organization id. Found in HCP organization settings."
  type        = string
}
