output "sso_endpoint" {
  value = cloudflare_zero_trust_access_application.this.saas_app.sso_endpoint
}

output "public_key" {
  value = cloudflare_zero_trust_access_application.this.saas_app.public_key
}
