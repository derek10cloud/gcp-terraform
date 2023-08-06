# // peer_vpn_gw_ip secrets
# output "secret_peer_vpn_gw_ip_names" {
#   value = values(google_secret_manager_secret.peer_vpn_gw_ip)[*].name
# }

# output "secret_peer_vpn_gw_ip_ids" {
#   value = values(google_secret_manager_secret.peer_vpn_gw_ip)[*].secret_id
# }

# // pre_shared_key of peer_vpn_gw_tunnel secrets
# output "secret_peer_vpn_gw_pre_shared_key_names" {
#   value = values(google_secret_manager_secret.pre_shared_key)[*].name
# }

# output "secret_peer_vpn_gw_pre_shared_key_ids" {
#   value = values(google_secret_manager_secret.pre_shared_key)[*].secret_id
# }

# // gcp_bgp_ip of vpn_gw_tunnel secrets
# output "secret_gcp_bgp_ip_names" {
#   value = values(google_secret_manager_secret.gcp_bgp_ip)[*].name
# }

# output "secret_gcp_bgp_ip_ids" {
#   value = values(google_secret_manager_secret.gcp_bgp_ip)[*].secret_id
# }

# // aws_bgp_ip of vpn_gw_tunnel secrets
# output "secret_aws_bgp_ip_names" {
#   value = values(google_secret_manager_secret.aws_bgp_ip)[*].name
# }

# output "secret_aws_bgp_ip_ids" {
#   value = values(google_secret_manager_secret.aws_bgp_ip)[*].secret_id
# }

// peer_vpn_gw_ip secrets
output "secret_peer_vpn_gw_ip_name" {
  value = google_secret_manager_secret.peer_vpn_gw_ip.name
}

output "secret_peer_vpn_gw_ip_id" {
  value = google_secret_manager_secret.peer_vpn_gw_ip.secret_id
}

// pre_shared_key of peer_vpn_gw_tunnel secrets
output "secret_peer_vpn_gw_pre_shared_key_name" {
  value = google_secret_manager_secret.pre_shared_key.name
}

output "secret_peer_vpn_gw_pre_shared_key_id" {
  value = google_secret_manager_secret.pre_shared_key.secret_id
}

// gcp_bgp_ip of vpn_gw_tunnel secrets
output "secret_gcp_bgp_ip_name" {
  value = google_secret_manager_secret.gcp_bgp_ip.name
}

output "secret_gcp_bgp_ip_id" {
  value = google_secret_manager_secret.gcp_bgp_ip.secret_id
}

// aws_bgp_ip of vpn_gw_tunnel secrets
output "secret_aws_bgp_ip_name" {
  value = google_secret_manager_secret.aws_bgp_ip.name
}

output "secret_aws_bgp_ip_id" {
  value = google_secret_manager_secret.aws_bgp_ip.secret_id
}
