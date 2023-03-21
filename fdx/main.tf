
##################################################
#AWS
##################################################
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
#provider "kubectl" {
#  host                   = local.host
#  cluster_ca_certificate = base64decode(local.cluster_ca_certificate)
#  token                  = data.aws_eks_cluster_auth.auth.token
#  load_config_file       = false
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
    client_certificate = base64decode(local.kubernetes_cluster_client_certificate)
    client_key = base64decode(local.kubernetes_cluster_client_key)
    cluster_ca_certificate = base64decode(local.kubernetes_cluster_ca_certificate)
    load_config_file = false
}

provider "helm" {
    kubernetes {
        host = local.kubernetes_cluster_host
        client_certificate = base64decode(local.kubernetes_cluster_client_certificate)
        client_key = base64decode(local.kubernetes_cluster_client_key)
        cluster_ca_certificate = base64decode(local.kubernetes_cluster_ca_certificate)
        load_config_file = false
    }
}

provider "kubectl" {
  host                   = local.kubernetes_cluster_host
  client_certificate = base64decode(local.kubernetes_cluster_client_certificate)
  client_key = base64decode(local.kubernetes_cluster_client_key)
  cluster_ca_certificate = base64decode(local.kubernetes_cluster_ca_certificate) 
  load_config_file       = false
}
