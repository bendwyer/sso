output "hcp_sso_endpoint" {
  value = module.hcp.sso_endpoint
}

output "hcp_public_key" {
  value = module.hcp.public_key
}

output "hcp_terraform_sso_endpoint" {
  value = module.hcp_terraform.sso_endpoint
}

output "hcp_terraform_idp_entity_id" {
  value = module.hcp_terraform.idp_entity_id
}

output "hcp_terraform_public_key" {
  value = module.hcp_terraform.public_key
}

output "iam_identity_center_sso_endpoint" {
  value = module.aws_iam_identity_center.sso_endpoint
}

output "iam_identity_center_idp_entity_id" {
  value = module.aws_iam_identity_center.idp_entity_id
}

output "iam_identity_center_public_key" {
  value = module.aws_iam_identity_center.public_key
}

output "tailscale_client_id" {
  value = module.tailscale.client_id
}

output "tailscale_client_secret" {
  value     = module.tailscale.client_secret
  sensitive = true
}
