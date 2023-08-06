resource "google_dns_managed_zone" "main" {
  name        = replace(var.dns_name, ".", "--")
  dns_name    = format("%s.", var.dns_name)
  description = var.description

  visibility = "private"

  dynamic "private_visibility_config" {
    for_each = var.network_ids
    content {
      networks {
        network_url = format("%s/%s/%s/%s", "https://www.googleapis.com/compute/v1/projects", var.project_id, "global/networks", private_visibility_config.value)
      }
    }
  }

  labels = var.labels
}

resource "google_dns_record_set" "main" {
  for_each     = { for record in var.records : join("/", [record.name, record.type]) => record }
  managed_zone = google_dns_managed_zone.main.name

  name    = format("%s.", each.value.name)
  type    = each.value.type
  ttl     = each.value.ttl
  rrdatas = each.value.values

  depends_on = [
    google_dns_managed_zone.main
  ]
}
