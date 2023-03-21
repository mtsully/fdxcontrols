output "kubernetes_cluster_name" {
  value       = google_container_cluster.primary.name
  sensitive = true
  description = "GKE Cluster Name"
}

output "kubernetes_cluster_host" {
  value       = google_container_cluster.primary.endpoint
  sensitive = true
  description = "GKE Cluster Host"
}

output "kubernetes_cluster_client_certificate" {
  value       = google_container_cluster.primary.master_auth.0.client_certificate
  sensitive = true
  description = "GKE Cluster Client Certificate"
}

output "kubernetes_cluster_client_key" {
  value       = google_container_cluster.primary.master_auth.0.client_key
  sensitive = true
  description = "GKE Cluster Client Key"
}

output "kubernetes_cluster_ca_certificate" {
  value       = google_container_cluster.primary.master_auth.0.cluster_ca_certificate
  sensitive = true
  description = "GKE Cluster CA Certificate"
}
