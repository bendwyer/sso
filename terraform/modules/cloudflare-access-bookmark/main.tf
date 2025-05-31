resource "cloudflare_zero_trust_access_application" "this" {
  account_id = var.cloudflare_account_id
  name       = var.bookmark_name
  type       = "bookmark"
  logo_url   = var.bookmark_logo_url
  domain     = var.bookmark_url
}
