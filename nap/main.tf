######################################
#AWS
######################################
#provider "aws" {
#    region     = local.aws_region
#}
#provider "kubernetes" {
#    host = local.host
#    cluster_ca_certificate = base64decode(local.cluster_ca_certificate)
#    token = data.aws_eks_cluster_auth.auth.token
#}
#provider "helm" {
#    kubernetes {
#        host = local.host
#        cluster_ca_certificate = base64decode(local.cluster_ca_certificate)
#        token = data.aws_eks_cluster_auth.auth.token  
#    }
#}

#######################################
#GCP
#######################################
provider "google" {
  project = local.project_id
  region  = local.region
}

provider "kubernetes" {
  host = "https://${local.kubernetes_cluster_host}"
  token = local.kubernetes_cluster_access_token
  cluster_ca_certificate = base64decode(local.kubernetes_cluster_ca_certificate)    
}

provider "helm" {
    kubernetes {
      host = "https://${local.kubernetes_cluster_host}"
      token = local.kubernetes_cluster_access_token
      cluster_ca_certificate = base64decode(local.kubernetes_cluster_ca_certificate)   
    }
}
