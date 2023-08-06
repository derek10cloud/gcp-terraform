// gcp common variables
variable "project" {
  type        = string
  description = "project id for vpn"
}

variable "region" {
  type        = string
  description = "region for vpn"
}

variable "labels" {
  type        = map(string)
  description = "labels for vpn resources"
}

// peer_vpn_gw_ips variables
variable "peer_vpn_gw_ip_name" {
  type        = string
  description = "secret manager name for peer vpn gateway ip"
}
