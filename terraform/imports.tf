# Import Auth0 default database connection
import {
  to = module.auth0.auth0_connection.this
  id = var.auth0_connection_default_database_id
}

# Import Cloudflare Access organization
import {
  to = module.cloudflare_access.cloudflare_zero_trust_access_organization.this
  id = var.cloudflare_account_id
}

# Import Cloudflare Access App Launcher
import {
  to = module.cloudflare_access.cloudflare_zero_trust_access_application.this
  id = "${var.cloudflare_account_id}/${var.cloudflare_access_app_launcher_id}"
}
