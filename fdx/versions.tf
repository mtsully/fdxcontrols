terraform {
  required_version = ">= 0.14.0"  
  required_providers {
    volterra = {
      source = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}
