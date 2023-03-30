output "url" {
  description = "Bucket URL"
  value       = local.first_bucket.url
}

output "name" {
  description = "Bucket name"
  value       = local.first_bucket.name
}
