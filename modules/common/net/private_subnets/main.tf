resource "google_compute_subnetwork" "data_subnet" {
  name          = var.subnet_name
  network       = var.vpc
  ip_cidr_range = var.ip_cidr_range

  region                   = var.region
  description              = var.description
  private_ip_google_access = var.private_ip_google_access
}
