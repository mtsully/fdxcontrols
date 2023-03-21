##############################################
#AWS
##############################################
#terraform {
#  required_version = ">= 0.14.0"
#  required_providers {
#    aws = ">= 4"
#    kubernetes = {
#      source = "hashicorp/kubernetes"
#      version = "2.16.1"
#    }
#    helm = {
#      source  = "hashicorp/helm"
#      version = ">=2.7.0"
#    }
#  }
#}
###############################################
#GCP
###############################################
terraform {
  required_version = ">= 0.14.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.27.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.16.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">=2.7.0"
    }
  }
}
