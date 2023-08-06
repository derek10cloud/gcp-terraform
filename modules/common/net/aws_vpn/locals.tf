locals {
  project = var.project
  region  = var.region

  vpn_tunnel_numbers = [1, 2]
  vpn_connection_names = var.redundancy_number == 4 ? flatten([for connection_name in var.vpn_connection_names : [
    for tunnel_number in local.vpn_tunnel_numbers : "${connection_name}-${tunnel_number}"
  ]]) : toset(var.vpn_connection_names)
  redundancy_number_object = { 1 : "SINGLE_IP_INTERNALLY_REDUNDANT", 2 : "TWO_IPS_REDUNDANCY", 4 : "FOUR_IPS_REDUNDANCY" }
}
