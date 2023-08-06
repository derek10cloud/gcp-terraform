locals {
  project_id = trimprefix(data.google_project.project.id, "projects/")
  blueprint  = yamldecode(file("${path.root}/dns_blueprint.yaml"))

  private_zones = {
    for v in local.blueprint.private_zone : v.name => {
      "name"        = v.name
      "description" = v.description
      "visibility"  = v.visibility
      "network_ids" = v.network_ids
      "records"     = v.records
    }
  }

  labels = local.blueprint.labels
}
