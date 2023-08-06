locals {
  project_id   = data.google_client_config.this.project
  region       = data.google_client_config.this.region
  net_settings = yamldecode(file("${path.root}/net_settings.yaml"))

  asn          = local.net_settings.vpn.asn
  peer_asn     = local.net_settings.vpn.peer_asn
  peer_gw_name = local.net_settings.vpn.peer_gw_name

  // vpc subnet cidr 외 광고해야하는 cidr 종류 (psc, serverless subnet, private service access 등등)
  custom_advertised_subnets = merge(values({ for k, v in local.net_settings.vpn.custom_cidr_set : k => {
    for subnet in v.subnets : subnet.name => {
      "range_name" = subnet.name
      "range" = cidrsubnet(
        v.cidr,
        subnet.bits,
        subnet.index
      )
    }
    }
  })...)

  aws_vpn_connection_names = var.aws_vpn_connection_names
  labels                   = local.net_settings.labels
}
