// cloud router 리소스 output
output "cloud_router_id" {
  value = google_compute_router.main.id
}

output "cloud_router_name" {
  value = google_compute_router.main.name
}

output "cloud_router_self_link" {
  value = google_compute_router.main.self_link
}

output "cloud_router_creation_timestamp" {
  value = google_compute_router.main.creation_timestamp
}

// gcp vpn_gw
output "vpn_gw_id" {
  value = google_compute_ha_vpn_gateway.main.id
}

output "vpn_gw_name" {
  value = google_compute_ha_vpn_gateway.main.name
}

output "vpn_gw_self_link" {
  value = google_compute_ha_vpn_gateway.main.self_link
}

// peer(aws) vpn_gw
output "peer_vpn_gw_id" {
  value = google_compute_external_vpn_gateway.main.id
}

output "peer_vpn_gw_name" {
  value = google_compute_external_vpn_gateway.main.name
}

output "peer_vpn_gw_self_link" {
  value = google_compute_external_vpn_gateway.main.self_link
}

output "peer_vpn_gw_redundancy_type" {
  value = google_compute_external_vpn_gateway.main.redundancy_type
}

// vpn tunnels
output "vpn_tunnel" {
  value = {
    for k, tunnel in google_compute_vpn_tunnel.main : k => {
      tunnel_name                     = tunnel.name
      peer_external_gateway           = tunnel.peer_external_gateway
      peer_external_gateway_interface = tunnel.peer_external_gateway_interface
      peer_ip                         = tunnel.peer_ip
      cloud_router_self_link          = tunnel.router
      tunnel_self_link                = tunnel.self_link
      tunnel_id                       = tunnel.id
      vpn_gateway                     = tunnel.vpn_gateway
      vpn_gateway_interface           = tunnel.vpn_gateway_interface
    }
  }
}

output "vpn_gcp_interface" {
  value = {
    for k, interface in google_compute_router_interface.main : k => {
      gcp_interface_id   = interface.id
      gcp_interface_name = interface.name
      gcp_router         = interface.router
      vpn_tunnel         = interface.vpn_tunnel
    }
  }
}

output "vpn_aws_router" {
  value = {
    for k, router in google_compute_router_peer.main : k => {
      id                        = router.id
      name                      = router.name
      advertise_mode            = router.advertise_mode
      advertised_groups         = router.advertised_groups
      advertised_ip_ranges      = router.advertised_ip_ranges
      advertised_route_priority = router.advertised_route_priority
      bfd                       = router.bfd
      interface                 = router.interface
      ip_address                = router.ip_address
      peer_asn                  = router.peer_asn
    }
  }
}
