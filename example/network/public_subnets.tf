/* -------------------------------------------------------------------------- */
/*                                public_subnet                               */
/* -------------------------------------------------------------------------- */

module "public_subnets" {
  source = "../../modules/common/net/public_subnets"

  for_each = local.subnet_regions.public.region

  vpc           = local.vpc_name
  subnet_name   = each.value.subnet_name
  ip_cidr_range = each.value.subnet_cidr

  region      = each.value.name
  description = "public subnet for ${each.value.subnet_name}"
}
