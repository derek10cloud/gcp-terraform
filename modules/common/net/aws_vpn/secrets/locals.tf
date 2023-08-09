locals {
  project = var.project
  region  = var.region
  # peer_vpn_gw_names = toset([for v in range(var.number_of_peer_vpn_gw_ips) : "${var.peer_vpn_gw_ip_name}-${v + 1}"])
}
locals {
  project = var.project
  region  = var.region
  # peer_vpn_gw_names = toset([for v in range(var.number_of_peer_vpn_gw_ips) : "${var.peer_vpn_gw_ip_name}-${v + 1}"])
}
