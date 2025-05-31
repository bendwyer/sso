SSO
===

[Auth0](https://auth0.com) is the **Identity Provider (IdP)** and [Cloudflare Access](https://www.cloudflare.com/zero-trust/products/access/) is the primary **Service Provider (SP)**. If possible, SSO applications should be added to the [App Launcher](https://developers.cloudflare.com/cloudflare-one/applications/app-launcher/) in Cloudflare Access.

When an application is added to App Launcher, for the purposes of documentation Cloudflare Access is the **IdP** and the application being added is the **SP**. Regardless, when login is initiated from App Launcher or the application's login page, Auth0 is still the "real" IdP and will handle user credentials.

Requirements
------------

- Auth0 (free)
- Cloudflare Access (free)
- Terraform CLI
- HCP Terraform (free)
- SaaS application(s) supporting SSO

Setup - Main
------------

> [!CAUTION]
> Deployment from zero without modification will almost certainly fail since many SP's need to be manually configured. That said, the "foundational" parts are the [auth0](./terraform//modules/auth0) and [cloudflare-access](./terraform/modules/cloudflare-access) modules, which _should_ "just work" from zero. Once those are setup, additional SaaS apps can be layered on.

> [!IMPORTANT]
> Anywhere you have to provision a user account manually, the username and email must be the same, and it needs to match the user information in Auth0.

When connecting Cloudflare Access with a SP, it may be necessary to create the application in Cloudflare Access with blank fields first so that the correct information can be generated for adding to the SP. Once the SP setup is complete, the application config in Cloudflare Access can be updated with the correct information.

### Auth0

Perform the following manual tasks:

- Create a Machine to Machine application for Terraform and permit access to the Auth0 Management API. We need the client secret for authenticating Terraform with Auth0.
- Create a user account. Username and email must be the same. This will be the SSO user that is created in the SP application.

#### Links

- [Create a custom SAML SSO integration](https://developer.auth0.com/resources/labs/authentication/create-a-custom-saml-sso-integration#introduction)

### Cloudflare Access

No manual tasks.

The following API token permissions are required for terraform:

- Zero Trust:Edit
- Access: Organizations, Identity Providers, and Groups:Edit
- Access: Apps and Policies:Edit
- All zones - DNS:Edit

If you're struggling to find reference ID's for Cloudflare objects to import, sometimes the information can be found by inspecting the page using the "Network" tab in your browser's development tools. Filter by "XHR/Fetch" (Safari) and you should find a corresponding item that contains the relevant ID. You may need to navigate to different pages for the correct info to show up though.

The v4.x provider is preferred for the moment since 5.x has a lot of problems.

#### Links

- [IdP Integration - Generic OIDC](https://developers.cloudflare.com/cloudflare-one/identity/idp-integration/generic-oidc/)

Setup - SaaS
------------

### AWS IAM Identity Center

The settings in AWS IAM Identity Center need to be manually configured. The [hashicorp/aws](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) provider does not (yet) support this operation (AWS SSO).

#### Links

- [SaaS Apps - AWS SSO](https://developers.cloudflare.com/cloudflare-one/applications/configure-apps/saas-apps/aws-sso-saas/)

### HCP (HashiCorp Cloud Platform)

The settings in HCP need to be manually configured. The [hashicorp/hcp](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs) provider does not (yet) support this operation. Once SSO is enabled, users can no longer be invited to the organization and should instead be provisioned in the IdP (Auth0).

#### Links

- [Invalid request: IdP initiated login is not enabled](https://support.hashicorp.com/hc/en-us/articles/4404712863379--invalid-request-IdP-Initiated-login-is-not-enabled-error-logging-into-HCP-via-SSO)
- [Cloudflare SAML SSO in HCP configuration](https://support.hashicorp.com/hc/en-us/articles/36026580143635-Cloudflare-SAML-SSO-in-HCP-Configuration)
- [Invite Users](https://developer.hashicorp.com/hcp/docs/hcp/iam/users#invite-users)

### HCP Terraform

The settings in HCP Terraform need to be manually configured. The [hashicorp/tfe](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs) provider does not (yet) support this operation.

#### Links

- [Support for configuring SSO on Terraform Cloud](https://github.com/hashicorp/terraform-provider-tfe/issues/975)

### Tailscale

If you need to migrate to an OIDC IdP, open a [support request](https://tailscale.com/contact/support) (bottom of the page) and provide the following information:

- Type of request: Identity provider configuration or change
- Domain name you will use to login to Tailscale (Webfinger needs to be configured to respond on this domain).
- Change SSO identity provider
- Old and new providers
- Client ID from Cloudflare Access
- Client Secret from Cloudflare Access
- Prompts (leave default)

#### Links

- [SSO Custom OIDC: Identity Provider Setup](https://tailscale.com/kb/1240/sso-custom-oidc#identity-provider-setup)
- [Auth using auth0 identity](https://github.com/tailscale/tailscale/issues/1222#issuecomment-1992731979)
- [Using Auth0 with Headscale and Tailscale](https://codingkoi.com/garden/tips-and-tricks/using-auth0-with-headscale-and-tailscale.html)

Setup - Bookmarks
-----------------

No real action is needed here, a Bookmark simply creates a shortcut in the App Launcher to a website. One thing to note is that Bookmarks cannot have policies applied, so if you plan to share this App Launcher dashboard with others, they will also be able to see and access your Bookmarks.

`required-providers` module
---------------------------

Instead of versioning each child module individually, the `required-providers` module handles provider versions for the entire deployment. Inspired by Martin Atkins' [comment](https://github.com/hashicorp/terraform/issues/35479#issuecomment-2239828829).
