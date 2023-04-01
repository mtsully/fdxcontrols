
output "api_url" {
  description = "XC Tenant API URL"
  value       = var.api_url
}

output "xc_namespace" {
  description = "XC namespace"
  value       = local.namespace
}

output "adn_name" {
  description = "ADN name"
  value       = var.adn_name
}

output "xc_vk8s_kubeconfig" {
  description = "XC vk8s generated kubeconfig"
  value       = volterra_api_credential.this.data
}

output "xc_vk8s_host" {
    value = yamldecode(base64decode(volterra_api_credential.this.data)).clusters[0].cluster.server
}

output "xc_vk8s_ca_cert" {
    value = yamldecode(base64decode(volterra_api_credential.this.data)).clusters[0].cluster.certificate-authority-data
}

output "xc_vk8s_client_cert" {
    value = yamldecode(base64decode(volterra_api_credential.this.data)).users[0].user.client-certificate-data
}

output "xc_vk8s_client_key" {
    value = yamldecode(base64decode(volterra_api_credential.this.data)).users[0].user.client-key-data
}
