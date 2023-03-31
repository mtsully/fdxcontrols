output "xc_namespace" {
  description = "XC namespace"
  value       = local.namespace
}
output "xc_vk8s_kubeconfig" {
  description = "XC vk8s generated kubeconfig"
  value       = yamldecode(volterra_api_credential.this.data)
}

output "xc_vk8s_host" {
    value = yamldecode(volterra_api_credential.this.data).clusters[0].cluster.server)
}

output "xc_vk8s_ca_cert" {
    value = file(yamldecode(volterra_api_credential.this.data).clusters[0].cluster.certificate-authority)
}
