output "url" {
  description = "Bucket URL" 
  value       = google_storage_bucket.bucket.url
}

output "name" {
  description = "Bucket name"
  value       = google_storage_bucket.bucket.name
}
