resource "cloudflare_zero_trust_access_application" "this" {
  account_id = var.cloudflare_account_id
  name       = "AWS Console"
  allowed_idps = [
    var.cloudflare_zero_trust_access_identity_provider
  ]
  auto_redirect_to_identity    = true
  session_duration             = "6h"
  skip_app_launcher_login_page = false
  type                         = "saas"
  logo_url                     = "https://a0.awsstatic.com/libra-css/images/site/fav/favicon.ico"

  policies = [
    var.cloudflare_zero_trust_access_policy
  ]

  saas_app {
    # auth_type = "saml"
    consumer_service_url = var.aws_iam_identity_center_acs_url
    name_id_format       = "email"
    sp_entity_id         = var.aws_iam_identity_center_entity_id
  }
}

data "aws_ssoadmin_instances" "this" {}

# Create a SSO user
resource "aws_identitystore_user" "this" {
  identity_store_id = tolist(data.aws_ssoadmin_instances.this.identity_store_ids)[0]

  display_name = "${var.aws_iam_identity_center_given_name} ${var.aws_iam_identity_center_family_name}"
  user_name    = var.aws_iam_identity_center_username

  name {
    given_name  = var.aws_iam_identity_center_given_name
    family_name = var.aws_iam_identity_center_family_name
  }

  emails {
    value = var.aws_iam_identity_center_username
  }
}

# Create a SSO group
resource "aws_identitystore_group" "this" {
  identity_store_id = tolist(data.aws_ssoadmin_instances.this.identity_store_ids)[0]
  display_name      = "sso-users"
  description       = "SSO Users"
}

# Add SSO user to group
resource "aws_identitystore_group_membership" "this" {
  identity_store_id = tolist(data.aws_ssoadmin_instances.this.identity_store_ids)[0]
  group_id          = aws_identitystore_group.this.group_id
  member_id         = aws_identitystore_user.this.user_id
}

# Retrieve information about a given permission set
data "aws_ssoadmin_permission_set" "this" {
  instance_arn = tolist(data.aws_ssoadmin_instances.this.arns)[0]
  name         = var.aws_iam_identity_center_permission_set
}

# Get information about AWS account
data "aws_caller_identity" "this" {}

# Attach permission set and AWS account to SSO group
resource "aws_ssoadmin_account_assignment" "this" {
  instance_arn       = tolist(data.aws_ssoadmin_instances.this.arns)[0]
  permission_set_arn = data.aws_ssoadmin_permission_set.this.arn

  principal_id   = aws_identitystore_group.this.group_id
  principal_type = "GROUP"

  target_id   = data.aws_caller_identity.this.account_id
  target_type = "AWS_ACCOUNT"
}
