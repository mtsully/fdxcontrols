locals {
  project = data.tfe_outputs.gcp-infra.values.project
  region = data.tfe_outputs.gcp-infra.values.region
}
