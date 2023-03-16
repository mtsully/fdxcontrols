data "tfe_outputs" "infra" {
  organization = var.tf_cloud_organization
  workspace = "infra"
}
data "tfe_outputs" "nap" {
  organization = var.tf_cloud_organization
  workspace = "nap"
}
