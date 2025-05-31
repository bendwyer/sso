variable "auth0_client_id" {
  description = "Auth0 client id."
  type        = string
}

variable "auth0_client_secret" {
  description = "Auth0 client secret."
  type        = string
}

variable "auth0_connection_default_database_id" {
  description = "Auth0 id for default database connection."
  type        = string
}

variable "auth0_domain" {
  description = "Auth0 domain."
  type        = string
}

variable "aws_access_key" {
  description = "AWS access key."
  type        = string
}

variable "aws_secret_key" {
  description = "AWS secret key."
  type        = string
}

variable "aws_region" {
  default     = "eu-central-1"
  description = "AWS region."
  type        = string
}

variable "aws_assume_role_arn" {
  description = "ARN of AWS IAM role to assume."
  type        = string
}

variable "aws_assume_role_session_name" {
  default     = "terraform-cli"
  description = "Session name for easier tracking in logs."
  type        = string
}

variable "cloudflare_access_app_launcher_id" {
  description = "Cloudflare id for App Launcher application."
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

variable "cloudflare_account_id" {
  description = "Cloudflare account id."
  type        = string
}

variable "cloudflare_api_token" {
  description = "Cloudflare API token."
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

variable "hcp_terraform_acs_url" {
  description = "SAML Assertion Consumer Service (ACS) url."
  type        = string
}

variable "hcp_terraform_entity_id" {
  description = "SAML Entity ID. Can also be called Issuer URL or Audience."
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
