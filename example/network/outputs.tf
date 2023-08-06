output "google_project_id" {
  value = trimprefix(data.google_project.project.id, "projects/")
}

output "available_region_name" {
  value = data.google_compute_regions.available
}

output "vpc_id" {
  value = google_compute_network.vpc.id
}

output "vpc_name" {
  value = google_compute_network.vpc.name
}

output "vpc_self_link" {
  value = google_compute_network.vpc.self_link
}

output "public_subnet" {
  value = {
    for subnet in module.public_subnets : subnet.subnet_name => {
      subnet_id              = subnet.subnet_id
      subnet_name            = subnet.subnet_name
      subnet_self_link       = subnet.subnet_self_link
      subnet_region          = subnet.subnet_region
      subnet_cidr            = subnet.subnet_cidr
      subnet_gateway_address = subnet.subnet_gateway_address
    }
  }
}

output "data_subnet" {
  value = {
    for subnet in module.data_subnets : subnet.subnet_name => {
      subnet_id              = subnet.subnet_id
      subnet_name            = subnet.subnet_name
      subnet_self_link       = subnet.subnet_self_link
      subnet_region          = subnet.subnet_region
      subnet_cidr            = subnet.subnet_cidr
      subnet_gateway_address = subnet.subnet_gateway_address
    }
  }
}

// private service connect
output "private_service_connect_googleapi_endpoint" {
  value = {
    "name" = google_compute_global_forwarding_rule.private_service_connect_googleapis_ip.name
    "ip"   = google_compute_global_address.googleapis_ip.address
  }
}
