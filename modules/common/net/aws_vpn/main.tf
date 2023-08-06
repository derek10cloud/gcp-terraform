// gcp cloud router for vpn
resource "google_compute_router" "main" {
  name        = var.cloud_router_name
  network     = var.vpc_name
  description = var.cloud_router_description
  bgp {
    asn                = var.asn
    keepalive_interval = var.keepalive_interval
    advertise_mode     = "CUSTOM"
    advertised_groups  = ["ALL_SUBNETS"]
    dynamic "advertised_ip_ranges" {
      for_each = var.custom_ip_list
      content {
        range       = advertised_ip_ranges.value.range
        description = advertised_ip_ranges.value.range_name
      }
    }
  }

  project = local.project
  region  = local.region
}

// gcp vpn gateway(ha)
resource "google_compute_ha_vpn_gateway" "main" {
  name    = var.vpn_gw_name
  network = var.vpc_name

  project = local.project
  region  = local.region
}

// peer(aws) vpn gateway
resource "google_compute_external_vpn_gateway" "main" {
  name            = var.peer_gw_name
  redundancy_type = local.redundancy_number_object[var.redundancy_number]

  dynamic "interface" {
    for_each = var.peer_gw_ips
    content {
      id         = interface.key
      ip_address = interface.value
    }
  }

  project = local.project
  labels  = var.labels
}

// gcp-aws vpn tunnel
resource "google_compute_vpn_tunnel" "main" {
  provider = google-beta
  for_each = local.vpn_connection_names

  name = each.value

  router                = google_compute_router.main.self_link
  vpn_gateway           = google_compute_ha_vpn_gateway.main.self_link
  vpn_gateway_interface = index(tolist(local.vpn_connection_names), each.value) == 0 || index(tolist(local.vpn_connection_names), each.value) == 1 ? 0 : 1

  peer_external_gateway           = google_compute_external_vpn_gateway.main.self_link
  peer_external_gateway_interface = index(tolist(local.vpn_connection_names), each.value)

  shared_secret = var.shared_secrets[index(tolist(local.vpn_connection_names), each.value)]

  labels = var.labels

  project = local.project
  region  = local.region

  depends_on = [
    google_compute_router.main,
    google_compute_ha_vpn_gateway.main,
    google_compute_external_vpn_gateway.main
  ]
}

// gcp vpn bgp session
resource "google_compute_router_interface" "main" {
  for_each = local.vpn_connection_names
  name     = each.value
  router   = google_compute_router.main.name

  ip_range   = "${var.gcp_bgp_ips[index(tolist(local.vpn_connection_names), each.value)]}/30"
  vpn_tunnel = each.value

  project = local.project
  region  = local.region
  depends_on = [
    google_compute_vpn_tunnel.main
  ]
}

// aws vpn router
resource "google_compute_router_peer" "main" {
  for_each = local.vpn_connection_names
  name     = each.value
  router   = google_compute_router.main.name

  peer_asn        = var.peer_asn
  peer_ip_address = var.aws_bgp_ips[index(tolist(local.vpn_connection_names), each.value)]
  interface       = each.value

  project = local.project
  region  = local.region
  depends_on = [
    google_compute_vpn_tunnel.main
  ]
}

