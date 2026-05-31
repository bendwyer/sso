output "connector_id" {
  value = cloudflare_sso_connector.this.id
}

output "verification_status" {
  value = cloudflare_sso_connector.this.verification.status
}

output "verification_code" {
  value = cloudflare_sso_connector.this.verification.code
}
