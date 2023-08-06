// gcp 기본 구성(project, region 등) output
output "google_project_id" {
  value = data.google_client_config.this.project
}

output "region" {
  value = data.google_client_config.this.region
}

##################################################
##    상위 dir의 vpn_to_aws 모듈이 참조할 secrets    ##
##################################################
output "secret_peer_vpn_gw_ip_names" {
  value = values(module.vpn_to_aws_secrets)[*].secret_peer_vpn_gw_ip_name
}

output "secret_peer_vpn_gw_ip_ids" {
  value = values(module.vpn_to_aws_secrets)[*].secret_peer_vpn_gw_ip_id
}

output "secret_peer_vpn_gw_pre_shared_key_names" {
  value = values(module.vpn_to_aws_secrets)[*].secret_peer_vpn_gw_pre_shared_key_name
}

output "secret_peer_vpn_gw_pre_shared_key_ids" {
  value = values(module.vpn_to_aws_secrets)[*].secret_peer_vpn_gw_pre_shared_key_id
}

output "secret_gcp_bgp_ip_names" {
  value = values(module.vpn_to_aws_secrets)[*].secret_gcp_bgp_ip_name
}

output "secret_gcp_bgp_ip_ids" {
  value = values(module.vpn_to_aws_secrets)[*].secret_gcp_bgp_ip_id
}

output "secret_aws_bgp_ip_names" {
  value = values(module.vpn_to_aws_secrets)[*].secret_aws_bgp_ip_name
}

output "secret_aws_bgp_ip_ids" {
  value = values(module.vpn_to_aws_secrets)[*].secret_aws_bgp_ip_id
}

output "secret_module_label" {
  value = local.secret_peer_gw_name
}
