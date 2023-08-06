// gcp 기본 구성(project, region 등) output
output "google_project_id" {
  value = data.google_client_config.this.project
}

output "region" {
  value = data.google_client_config.this.region
}

// cloud router 리소스 output
output "cloud_router_id" {
  value = module.vpn_to_aws.cloud_router_id
}

output "cloud_router_name" {
  value = module.vpn_to_aws.cloud_router_name
}

output "cloud_router_self_link" {
  value = module.vpn_to_aws.cloud_router_self_link
}

output "cloud_router_creation_timestamp" {
  value = module.vpn_to_aws.cloud_router_creation_timestamp
}

// gcp vpn_gw
output "vpn_gw_id" {
  value = module.vpn_to_aws.vpn_gw_id
}

output "vpn_gw_name" {
  value = module.vpn_to_aws.vpn_gw_name
}

output "vpn_gw_self_link" {
  value = module.vpn_to_aws.vpn_gw_self_link
}

// peer(aws) vpn_gw
output "peer_vpn_gw_id" {
  value = module.vpn_to_aws.peer_vpn_gw_id
}

output "peer_vpn_gw_name" {
  value = module.vpn_to_aws.peer_vpn_gw_name
}

output "peer_vpn_gw_self_link" {
  value = module.vpn_to_aws.peer_vpn_gw_self_link
}

output "peer_vpn_gw_redundancy_type" {
  value = module.vpn_to_aws.peer_vpn_gw_redundancy_type
}

// vpn tunnels
output "vpn_tunnel" {
  value = module.vpn_to_aws.vpn_tunnel
}

output "vpn_gcp_interface" {
  value = module.vpn_to_aws.vpn_gcp_interface
}

output "vpn_aws_router" {
  value = module.vpn_to_aws.vpn_aws_router
}
