resource "google_compute_firewall" "allow_exmaple_fw" {
  project     = local.project_id
  name        = var.fw_name
  network     = local.vpc_name
  description = var.fw_description

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = var.fw_source_ranges
  target_tags   = [var.fw_name]
}
