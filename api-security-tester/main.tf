provider "volterra" {
  url          = var.api_url
}

  provider "kubectl" {
# Will use the KUBE_LOAD_CONFIG_FILE env variable set in Terraform Cloud to "_output/xc_vk8s_kubeconfig" 
  load_config_file       = true
}
