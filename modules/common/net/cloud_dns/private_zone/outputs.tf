// dns zone
output "dns_name" {
  value = google_dns_managed_zone.main.dns_name
}

output "dns_description" {
  value = google_dns_managed_zone.main.description
}

output "name_servers" {
  value = google_dns_managed_zone.main.name_servers
}

output "dns_visibility" {
  value = google_dns_managed_zone.main.visibility
}

// dns records
output "records" {
  value = {
    for k, record in google_dns_record_set.main : k => {
      name         = record.name
      type         = record.type
      ttl          = record.ttl
      records      = record.rrdatas
      managed_zone = record.managed_zone
    }
  }
}
