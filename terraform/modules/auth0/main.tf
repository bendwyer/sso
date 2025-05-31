resource "auth0_connection" "this" {
  name     = "Username-Password-Authentication"
  strategy = "auth0"

  options {
    brute_force_protection = true
    disable_signup         = true
    authentication_methods {
      passkey {
        enabled = true
      }
    }
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "auth0_prompt" "this" {
  universal_login_experience = "new"
  identifier_first           = true
}
