locals {
  project_prefix = data.tfe_outputs.infra.values.project_prefix
  build_suffix = data.tfe_outputs.infra.values.build_suffix
  origin_nginx = try(data.tfe_outputs.nap.values.external_name, "")
  origin_server = local.origin_nginx
  origin_port = try(data.tfe_outputs.nap.values.external_port, "80")
  dns_origin_pool = local.origin_nginx != "" ? true : false 
}
