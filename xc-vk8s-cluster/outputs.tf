output "xc_namespace" {
  description = "XC namespace"
  value       = local.namespace
}
output "xc_vk8s_kubeconfig" {
  description = "XC vk8s generated kubeconfig"
  value       = volterra_api_credential.this.data
}
