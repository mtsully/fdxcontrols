locals {
  project_id = data.tfe_outputs.gcp-infra.values.project_id
  region = data.tfe_outputs.gcp-infra.values.region
  network_name    = data.tfe_outputs.gcp-infra.values.vpc_name
  subnet_name = data.tfe_outputs.gcp-infra.values.subnet_name
  deployment_name = data.tfe_outputs.gcp-infra.values.deployment_name
}
