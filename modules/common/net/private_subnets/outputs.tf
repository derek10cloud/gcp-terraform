output "subnet_id" {
  value = google_compute_subnetwork.data_subnet.id
}

output "subnet_name" {
  value = google_compute_subnetwork.data_subnet.name
}

output "subnet_self_link" {
  value = google_compute_subnetwork.data_subnet.self_link
}

output "subnet_region" {
  value = google_compute_subnetwork.data_subnet.region
}

output "subnet_cidr" {
  value = google_compute_subnetwork.data_subnet.ip_cidr_range
}

output "subnet_gateway_address" {
  value = google_compute_subnetwork.data_subnet.gateway_address
}

