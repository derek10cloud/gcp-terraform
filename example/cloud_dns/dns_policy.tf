resource "google_dns_policy" "inbound_dns_query_from_other_csp" {
  name                      = "${local.labels.environment}-inbound-dns-query-from-other-csp"
  enable_inbound_forwarding = true

  enable_logging = true

  networks {
    network_url = data.google_compute_network.vpc.id
  }
}
