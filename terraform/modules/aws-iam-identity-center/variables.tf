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

variable "aws_iam_identity_center_acs_url" {
  description = "SAML Assertion Consumer Service (ACS) url."
  type        = string
}

variable "aws_iam_identity_center_entity_id" {
  description = "SAML Entity ID. Can also be called Issuer URL or Audience."
  type        = string
}

variable "aws_iam_identity_center_family_name" {
  description = "Family (last) name for IAM Identity Center."
  type        = string
}

variable "aws_iam_identity_center_given_name" {
  description = "Given (first) name for IAM Identity Center."
  type        = string
}

variable "aws_iam_identity_center_permission_set" {
  description = "Permission set to assign the created AWS Identity Center group."
  type        = string
}

variable "aws_iam_identity_center_username" {
  description = "Username for IAM Identity Center. Must be email for SSO from Auth0/Cloudflare to work correctly."
  type        = string
}
