locals {
  project_id      = data.google_client_config.this.project
  region          = data.google_client_config.this.region
  secret_settings = yamldecode(file("${path.root}/secret_settings.yaml"))

  number_of_peer_vpn_gw_ips = 4
  number_range_vpn_gw_ips   = range(1, local.number_of_peer_vpn_gw_ips + 1)

  peer_gw_name        = local.secret_settings.vpn_to_aws.peer_gw_name
  secret_prefix       = local.secret_settings.vpn_to_aws.secret_prefix
  secret_peer_gw_name = "${local.secret_prefix}${local.peer_gw_name}"

  labels = local.secret_settings.labels
}
