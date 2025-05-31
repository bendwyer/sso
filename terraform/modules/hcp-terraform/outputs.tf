output "sso_endpoint" {
  value = cloudflare_zero_trust_access_application.this.saas_app[0].sso_endpoint
}

output "idp_entity_id" {
  value = cloudflare_zero_trust_access_application.this.saas_app[0].idp_entity_id
}

output "public_key" {
  value = cloudflare_zero_trust_access_application.this.saas_app[0].public_key
}
