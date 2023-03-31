provider "volterra" {
  url          = data.tfe_outputs.xc-vk8s.api_url
}

  provider "kubectl" {
    host = data.tfe_outputs.xc-vk8s.xc_vk8s_host
    cluster_ca_certificate = data.tfe_outputs.xc-vk8s.xc_vk8s_ca_cert
    client_certificate = data.tfe_outputs.xc-vk8s.xc_vk8s_client_cert
    load_config_file       = false
}
