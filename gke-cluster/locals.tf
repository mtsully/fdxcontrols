locals {
  project_id = data.tfe_outputs.gcp-infra.values.project_id
  region = data.tfe_outputs.gcp-infra.values.region
}
