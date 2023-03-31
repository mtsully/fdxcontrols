terraform {
  required_version = ">= 0.13.1"

  required_providers {
    volterra = {
      source  = "volterraedge/volterra"
      version = ">= 0.11.5"
    }
    kubectl = {
      source = "gavinbunney/kubectl"
      version = ">= 1.14.0"
    }
    local = ">= 2.0"
    null  = ">= 3.0"
  }
}
