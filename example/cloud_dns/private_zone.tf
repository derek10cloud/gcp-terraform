/* -------------------------------------------------------------------------- */
/*                              private dns zone                              */
/* -------------------------------------------------------------------------- */
module "googleapis_com" {
  source      = "../../modules/common/net/cloud_dns/private_zone"
  dns_name    = local.private_zones["googleapis.com"].name
  description = local.private_zones["googleapis.com"].description
  network_ids = local.private_zones["googleapis.com"].network_ids
  records     = local.private_zones["googleapis.com"].records

  project_id = local.project_id
  labels     = local.labels
}
