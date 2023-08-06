// 사용자가 콘솔에서 secret 값을 입력할 수 있도록 secret을 먼저 만들어요.
// secret manager 리소스를 만들고, 콘솔에서 secret 값을 입력한 이후에 상위 폴더에서 secret값들을 참조하는 관련 리소스를 만들어요.
module "vpn_to_aws_secrets" {
  source   = "../../../modules/common/net/aws_vpn/secrets"
  for_each = { for v in local.number_range_vpn_gw_ips : tostring(v) => v }

  peer_vpn_gw_ip_name = "${local.secret_peer_gw_name}-${each.key}"

  project = local.project_id
  region  = local.region
  labels = merge(local.labels,
    {
      "module" = local.secret_peer_gw_name
  })
}
