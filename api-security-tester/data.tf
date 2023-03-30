data "tfe_outputs" "gcp-storage-bucket" {
  organization = var.tf_cloud_organization
  workspace = "gcp-storage-bucket"
}
