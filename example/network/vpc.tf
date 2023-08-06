resource "google_compute_network" "vpc" {
  project                 = local.project_id
  name                    = local.vpc_name
  description             = "GCP ${local.labels.environment} vpc"
  routing_mode            = "GLOBAL"
  auto_create_subnetworks = false
}
