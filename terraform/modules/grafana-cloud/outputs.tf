output "client_id" {
  value = cloudflare_zero_trust_access_application.this.saas_app[0].client_id
}

output "client_secret" {
  value = cloudflare_zero_trust_access_application.this.saas_app[0].client_secret
}
