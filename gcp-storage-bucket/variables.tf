#TF Cloud
variable "tf_cloud_organization" {
  type = string
  description = "TF cloud org (Value set in TF cloud)"
}

variable "bucket_name" {
  type = string
  description = "GCP Storage Bucket Name"
}
