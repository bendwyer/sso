terraform {
  cloud {
    hostname = "app.terraform.io"
    workspaces {
      tags = {
        "iam" = "sso"
      }
    }
  }
}
