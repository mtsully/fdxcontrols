data "tfe_outputs" "gcp-infra" {
  organization = var.tf_cloud_organization
  workspace = "gcp-infra"
}
data "tfe_outputs" "nap" {
  organization = var.tf_cloud_organization
  workspace = "nap"
}
