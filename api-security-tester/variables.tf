#TF Cloud
variable "tf_cloud_organization" {
  type        = string
  description = "TF cloud org (Value set in TF cloud)"
}

variable "app_domain" {
  type        = string
  description = "FQDN for the app. If you have delegated domain `prod.example.com`, then your app_domain can be `<app_name>.prod.example.com`"
}

variable "enable_hsts" {
  type        = bool
  description = "Flag to enable hsts for HTTPS loadbalancer"
  default     = false
}

variable "enable_redirect" {
  type        = bool
  description = "Flag to enable http redirect to HTTPS loadbalancer"
  default     = true
}

variable "js_script_delay" {
  type        = number
  description = "Javascript challenge delay in miliseconds"
  default     = 5000
}

variable "js_cookie_expiry" {
  type        = number
  description = "Javascript cookie expiry time in seconds"
  default     = 3600
}

variable "disable_js_challenge" {
  type        = bool
  description = "disable javascript challenge"
  default     = false
}

variable "blocking" {
  type        = bool
  description = "Enable blocking mode for app_firewall"
  default     = true
}
 
variable "mail_host" {
  type        = string
  description = "SMTP Host to send RoboTets Reports to"
  default     = "in-v3.mailjet.com"
}

variable "mail_port" {
  type        = number
  description = "SMTP Port to send RoboTets Reports to"
  default     = 2525
}

variable "mail_api_key" {
  type        = string
  description = "SMTP Server username or API Key"
}

variable "mail_api_secret" {
  type        = string
  description = "SMTP Server password or API Secret"
}

variable "mail_from_addr" {
  type        = string
  description = "RoboTest Reports mail FROM Address"
}

variable "mail_to_addr" {
  type        = string
  description = "RoboTest Reports mail TO Address"
}


