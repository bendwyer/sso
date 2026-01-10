output "client_id" {
  value = cloudflare_zero_trust_access_application.this.saas_app[0].client_id
}

output "client_secret" {
  value = cloudflare_zero_trust_access_application.this.saas_app[0].client_secret
}

output "issuer_url" {
  value = "https://${var.cloudflare_access_team_domain}.cloudflareaccess.com/cdn-cgi/access/sso/oidc/${cloudflare_zero_trust_access_application.this.saas_app[0].client_id}"
}
