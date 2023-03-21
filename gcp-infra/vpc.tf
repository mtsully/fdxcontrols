# VPC
resource "google_compute_network" "vpc" {
  name                    = "${var.deployment_name}-vpc"
  auto_create_subnetworks = "false"
}
