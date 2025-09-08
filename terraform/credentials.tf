data "onepassword_vault" "this" {
  uuid = var.onepassword_vault_uuid
}

data "onepassword_item" "auth0" {
  vault = data.onepassword_vault.this.uuid
  uuid  = var.onepassword_item_uuid_auth0
}

data "onepassword_item" "cloudflare" {
  vault = data.onepassword_vault.this.uuid
  uuid  = var.onepassword_item_uuid_cloudflare
}

data "onepassword_item" "grafana_cloud" {
  vault = data.onepassword_vault.this.uuid
  uuid  = var.onepassword_item_uuid_grafana_cloud
}
