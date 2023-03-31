output "xc_namespace" {
  description = "XC namespace"
  value       = local.namespace
}
output "xc_vk8s_kubeconfig" {
  description = "XC vk8s generated kubeconfig"
  value       = yamldecode(base64decode(volterra_api_credential.this.data))
}

output "xc_vk8s_host" {
    value = yamldecode(base64decode(volterra_api_credential.this.data)).clusters[0].cluster.server)
}

output "xc_vk8s_ca_cert" {
    value = file(yamldecode(base64decodevolterra_api_credential.this.data)).clusters[0].cluster.certificate-authority)
}

output "xc_vk8s_client_key" {
    value = file(yamldecode(base64decodevolterra_api_credential.this.data)).users[0].user.client-key-data)
}
