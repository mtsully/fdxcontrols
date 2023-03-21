##############################################################
#AWS
##############################################################
#locals {
#  project_prefix = data.tfe_outputs.infra.values.project_prefix
#  build_suffix = data.tfe_outputs.infra.values.build_suffix
#  aws_region = data.tfe_outputs.infra.values.aws_region
#  host = data.tfe_outputs.eks.values.cluster_endpoint
#  cluster_ca_certificate = data.tfe_outputs.eks.values.kubeconfig-certificate-authority-data
#  cluster_name = data.tfe_outputs.eks.values.cluster_name
#}

##############################################################
#GCP
##############################################################
locals {
  project_id = data.tfe_outputs.gcp-infra.values.project_id
  region = data.tfe_outputs.gcp-infra.values.region
  kubernetes_cluster_name = data.tfe_outputs.gke.values.kubernetes_cluster_name
  kubernetes_cluster_host = data.tfe_outputs.gke.values.kubernetes_cluster_host
  kubernetes_cluster_client_certificate = data.tfe_outputs.gke.values.kubernetes_cluster_client_certificate
  kubernetes_cluster_client_key = data.tfe_outputs.gke.values.kubernetes_cluster_client_key
  kubernetes_cluster_ca_certificate =  data.tfe_outputs.gke.values.kubernetes_cluster_ca_certificate
  deployment_name = data.tfe_outputs.gcp-infra.values.deployment_name
}
