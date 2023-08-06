/* -------------------------------------------------------------------------- */
/*                 private service connect for all googleapis                 */
/* -------------------------------------------------------------------------- */
resource "google_compute_global_address" "googleapis_ip" {
  provider = google-beta
  network  = google_compute_network.vpc.id

  name        = local.global_ip_address_list.karrot-alpha-googleapis-ip.name
  description = local.global_ip_address_list.karrot-alpha-googleapis-ip.description
  purpose     = local.global_ip_address_list.karrot-alpha-googleapis-ip.purpose

  address_type = local.global_ip_address_list.karrot-alpha-googleapis-ip.address_type
  address      = local.global_ip_address_list.karrot-alpha-googleapis-ip.address

  labels  = local.labels
  project = local.project_id
}

resource "google_compute_global_forwarding_rule" "private_service_connect_googleapis_ip" {
  provider = google-beta
  network  = google_compute_network.vpc.id

  // 이름에 영어 소문자만 허용됨
  name       = "devgoogleapis"
  target     = "all-apis"
  ip_address = google_compute_global_address.googleapis_ip.id
  // lb schema가 필요없지만, ""로 설정해야 함
  load_balancing_scheme = ""

  project = local.project_id
}
