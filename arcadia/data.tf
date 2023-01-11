data "tfe_outputs" "infra" {
  organization = var.tf_cloud_organzation
  workspace = "infra"
}
data "tfe_outputs" "eks" {
  organization = var.tf_cloud_organzation
  workspace = "eks"
}
data "tfe_outputs" "nap" {
  organization = var.tf_cloud_organzation
  workspace = "nap-kic"
}
data "aws_eks_cluster_auth" "auth" {
  name = data.tfe_outputs.eks.values.cluster_name
}
