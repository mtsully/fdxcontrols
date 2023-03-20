locals {
  project_id = data.tfe_outputs.gcp-infra.values.project_id
  region = data.tfe_outputs.gcp-infra.values.region
  network    = data.tfe_outputs.gcp-infra.values.vpc_name
  subnetwork = data.tfe_outputs.gcp-infra.values.subnet_name
  cluster_primary_name = data.tfe_outputs.gcp-infra.values.cluster_primary_name
}
