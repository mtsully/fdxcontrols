#TF Cloud
variable "tf_cloud_organization" {
  type        = string
  description = "TF cloud org (Value set in TF cloud)"
}

variable "adn_name" {
  type        = string
  description = "ADN Name. Also used as a prefix in names of related resources."
}

variable "api_url" {
  type        = string
  description = "Your F5 XC tenant api url"
}

variable "volterra_namespace_exists" {
  type        = string
  description = "Flag to create or use existing volterra namespace"
  default     = false
}

variable "volterra_namespace" {
  type        = string
  description = "Volterra app namespace where the object will be created. This cannot be system or shared ns."
}


