output "auth0_idp_oidc" {
  value = cloudflare_zero_trust_access_identity_provider.this.id
}

output "private_applications_policy" {
  value = cloudflare_zero_trust_access_policy.private_applications.id
}

output "shared_applications_policy" {
  value = cloudflare_zero_trust_access_policy.shared_applications.id
}
