module "aws_iam_identity_center" {
  source = "./modules/aws-iam-identity-center"

  cloudflare_account_id                          = var.cloudflare_account_id
  cloudflare_zero_trust_access_identity_provider = module.cloudflare_access.auth0_idp_oidc
  cloudflare_zero_trust_access_policy            = module.cloudflare_access.private_applications_policy
  aws_iam_identity_center_acs_url                = var.aws_iam_identity_center_acs_url
  aws_iam_identity_center_entity_id              = var.aws_iam_identity_center_entity_id
  aws_iam_identity_center_family_name            = var.aws_iam_identity_center_family_name
  aws_iam_identity_center_given_name             = var.aws_iam_identity_center_given_name
  aws_iam_identity_center_permission_set         = var.aws_iam_identity_center_permission_set
  aws_iam_identity_center_username               = var.aws_iam_identity_center_username
}

module "hcp" {
  source = "./modules/hcp"

  cloudflare_account_id                          = var.cloudflare_account_id
  cloudflare_zero_trust_access_identity_provider = module.cloudflare_access.auth0_idp_oidc
  cloudflare_zero_trust_access_policy            = module.cloudflare_access.private_applications_policy
  cloudflare_zone_name                           = var.cloudflare_zone_name
  hcp_acs_url                                    = var.hcp_acs_url
  hcp_domain_verification_content                = var.hcp_domain_verification_content
  hcp_entity_id                                  = var.hcp_entity_id
  hcp_organization_id                            = var.hcp_organization_id
}

module "hcp_terraform" {
  source = "./modules/hcp-terraform"

  cloudflare_account_id                          = var.cloudflare_account_id
  cloudflare_zero_trust_access_identity_provider = module.cloudflare_access.auth0_idp_oidc
  cloudflare_zero_trust_access_policy            = module.cloudflare_access.private_applications_policy
  hcp_terraform_acs_url                          = var.hcp_terraform_acs_url
  hcp_terraform_entity_id                        = var.hcp_terraform_entity_id
}

module "tailscale" {
  source = "./modules/tailscale"

  cloudflare_account_id                          = var.cloudflare_account_id
  cloudflare_zero_trust_access_identity_provider = module.cloudflare_access.auth0_idp_oidc
  cloudflare_zero_trust_access_policy            = module.cloudflare_access.private_applications_policy
}
