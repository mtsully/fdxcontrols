# VPC
resource "google_compute_network" "vpc" {
  name                    = "${var.project_id}-fdx-ref-impl-vpc"
  auto_create_subnetworks = "false"
}
