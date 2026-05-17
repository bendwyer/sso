output "hcp_sso_endpoint" {
  value = module.hcp.sso_endpoint
}

output "hcp_public_key" {
  value = module.hcp.public_key
}

output "hcp_terraform_static_sso_endpoint" {
  value = try(module.hcp_terraform["static"].sso_endpoint, "")
}

output "hcp_terraform_static_idp_entity_id" {
  value = try(module.hcp_terraform["static"].idp_entity_id, "")
}

output "hcp_terraform_static_public_key" {
  value = try(module.hcp_terraform["static"].public_key, "")
}

output "hcp_terraform_ephemeral_sso_endpoint" {
  value = try(module.hcp_terraform["ephemeral"].sso_endpoint, "")
}

output "hcp_terraform_ephemeral_idp_entity_id" {
  value = try(module.hcp_terraform["ephemeral"].idp_entity_id, "")
}

output "hcp_terraform_ephemeral_public_key" {
  value = try(module.hcp_terraform["ephemeral"].public_key, "")
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
