provider "volterra" {
  url          = data.tfe_outputs.xc-vk8s.values.api_url
}

  provider "kubectl" {
    host = data.tfe_outputs.xc-vk8s.values.xc_vk8s_host
    cluster_ca_certificate = base64decode(data.tfe_outputs.xc-vk8s.values.xc_vk8s_ca_cert)
    client_certificate = base64decode(data.tfe_outputs.xc-vk8s.values.xc_vk8s_client_cert)
    client_key = base64decode(data.tfe_outputs.xc-vk8s.values.xc_vk8s_client_key)
    load_config_file       = false
}
