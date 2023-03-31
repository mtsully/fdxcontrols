output "xc_namespace" {
  description = "XC namespace"
  value       = local.namespace
}
output "xc_vk8s_kubeconfig" {
  description = "Domain VIP to access the OIDC Proxy application, running on ADN"
  value       = format("https://oidc-proxy.%s", var.app_domain)
}
