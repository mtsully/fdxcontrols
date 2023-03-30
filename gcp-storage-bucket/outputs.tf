output "uri" {
  description = "The URI of the created resource" 
  value       = google_storage_bucket.bucket.self_link
}

output "gs_url" {
  description = "The base URL of the bucket, in the format gs://<bucket-name>"
  value       = google_storage_bucket.bucket.url
}
