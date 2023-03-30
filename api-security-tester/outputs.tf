output "oidc_provider_url" {
  description = "Domain VIP to access the OIDC Provider application, running on ADN"
  value       = format("https://oidc-provider.%s", var.app_domain)
}
output "oidc_proxy_url" {
  description = "Domain VIP to access the OIDC Proxy application, running on ADN"
  value       = format("https://oidc-proxy.%s", var.app_domain)
}
