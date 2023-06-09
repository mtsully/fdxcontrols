data "kubernetes_service_v1" "nginx-service" {
  metadata {
    name = format("%s-%s-controller", helm_release.nginx-plus-ingress.name, helm_release.nginx-plus-ingress.chart)
    namespace = helm_release.nginx-plus-ingress.namespace
  }
}

#############################################
#AWS
############################################
#data "tfe_outputs" "infra" {
#  organization = var.tf_cloud_organization
#  workspace = "infra"
#}
#data "tfe_outputs" "eks" {
#  organization = var.tf_cloud_organization
#  workspace = "eks"
#}
#data "aws_eks_cluster_auth" "auth" {
#  name = data.tfe_outputs.eks.values.cluster_name
#}
############################################

##############################################################
#GCP
##############################################################
data "tfe_outputs" "gcp-infra" {
  organization = var.tf_cloud_organization
  workspace = "gcp-infra"
}
data "tfe_outputs" "gke" {
  organization = var.tf_cloud_organization
  workspace = "gke"
}
