// secret value 참조용
data "google_secret_manager_secret_version" "peer_vpn_gw_ips" {
  for_each = toset(data.terraform_remote_state.asne3_common_net_secrets.outputs.secret_peer_vpn_gw_ip_ids)
  secret   = each.value
}

data "google_secret_manager_secret_version" "peer_vpn_gw_pre_shared_keys" {
  for_each = toset(data.terraform_remote_state.asne3_common_net_secrets.outputs.secret_peer_vpn_gw_pre_shared_key_ids)
  secret   = each.value
}

data "google_secret_manager_secret_version" "gcp_bgp_ips" {
  for_each = toset(data.terraform_remote_state.asne3_common_net_secrets.outputs.secret_gcp_bgp_ip_ids)
  secret   = each.value
}

data "google_secret_manager_secret_version" "aws_bgp_ips" {
  for_each = toset(data.terraform_remote_state.asne3_common_net_secrets.outputs.secret_aws_bgp_ip_ids)
  secret   = each.value
}

// vpc name 참조용
data "google_compute_network" "vpc" {
  // name    = "vpc_name"
  project = local.project_id
}

// aws와 vpn 연동 부분
module "vpn_to_aws" {
  source                   = "../../modules/common/net/aws_vpn"
  cloud_router_name        = "${local.project_id}-${local.region}"
  vpc_name                 = data.google_compute_network.vpc.name
  cloud_router_description = "${local.project_id} router in ${local.region} for vpn connection with aws"
  asn                      = local.asn
  keepalive_interval       = 30

  vpn_gw_name    = "${local.project_id}-${local.region}"
  custom_ip_list = values(local.custom_advertised_subnets)

  peer_gw_name      = local.peer_gw_name
  peer_gw_ips       = values(data.google_secret_manager_secret_version.peer_vpn_gw_ips)[*].secret_data
  redundancy_number = length(values(data.google_secret_manager_secret_version.peer_vpn_gw_ips)[*].secret_data)

  // aws_vpn_connection_names are list of aws's customer gateway name
  vpn_connection_names = local.aws_vpn_connection_names
  shared_secrets       = values(data.google_secret_manager_secret_version.peer_vpn_gw_pre_shared_keys)[*].secret_data

  peer_asn    = local.peer_asn
  gcp_bgp_ips = values(data.google_secret_manager_secret_version.gcp_bgp_ips)[*].secret_data
  aws_bgp_ips = values(data.google_secret_manager_secret_version.aws_bgp_ips)[*].secret_data

  project = local.project_id
  region  = local.region
  labels  = local.labels
}
