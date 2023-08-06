locals {
  project_id = trimprefix(data.google_project.project.id, "projects/")
  blueprint  = yamldecode(file("${path.root}/vpc_blueprint.yaml"))
  vpc_name   = local.blueprint.vpc.name
  global_ip_address_list = {
    for v in local.blueprint.global_ip_address_list : v.name => {
      "name"         = v.name
      "description"  = v.description
      "address_type" = v.address_type
      "purpose"      = v.purpose
      "address"      = v.address
    }
  }

  // vpc내의 서브넷에서 사용할 수 있는 모든 cidr 대역 리스트(확장 가능)
  vpc_cidrs = local.blueprint.vpc.cidr_set[*].primary_cidr
  labels = local.blueprint.labels

  subnet_regions = {
    for subnet in local.blueprint.subnets : subnet.name => {
      "region" = merge(values({
        for vpc_regions_key, vpc_regions_value in local.blueprint.vpc.cidr_set : vpc_regions_key => {
          for region in vpc_regions_value.regions : region.name => {
            name = region.name
            subnet_cidr = cidrsubnet(
              cidrsubnet(vpc_regions_value.primary_cidr, region.bits, region.index),
              subnet.bits,
              subnet.index
            )
            subnet_name = join("-", ["alpha", region.name, subnet.name])
          }
        }
      })...)
      "name" = subnet.name
    }
  }
}
