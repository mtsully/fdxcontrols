#TF Cloud
variable "tf_cloud_organization" {
  type = string
  description = "TF cloud org (Value set in TF cloud)"
}
variable "gke_num_nodes" {
  default     = 2
  description = "number of gke nodes"
}
