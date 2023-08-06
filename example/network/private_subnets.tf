/* -------------------------------------------------------------------------- */
/*                               data_subnet                               */
/* -------------------------------------------------------------------------- */

module "private_subnets" {
  source = "../../modules/common/net/data_subnets"

  for_each = local.subnet_regions.data.region

  vpc           = local.vpc_name
  subnet_name   = each.value.subnet_name
  ip_cidr_range = each.value.subnet_cidr

  region      = each.value.name
  description = "data subnet for ${each.value.subnet_name}"
}
