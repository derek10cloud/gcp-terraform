// gcp common variables
variable "project" {
  type        = string
  description = "project id for vpn"
}

variable "region" {
  type        = string
  description = "region for vpn"
}

variable "vpc_name" {
  description = "vpc name for vpn"
}

variable "labels" {
  type        = map(string)
  description = "labels for vpn resources"
}

// gcp cloud router variables
variable "cloud_router_name" {
  type        = string
  description = "name for cloud router"
}

variable "cloud_router_description" {
  type        = string
  description = "description for cloud router"
}

variable "asn" {
  type        = number
  description = "asn for cloud router"
}

variable "keepalive_interval" {
  type        = number
  description = "keepalive interval for cloud router"
}

variable "custom_ip_list" {
  type = list(object({
    range : string,
    range_name : string,
  }))
  description = "custom ip list to advertise for cloud router"
}

// gcp vpn gaeteway(ha) variables
variable "vpn_gw_name" {
  type        = string
  description = "name for vpn gateway"
}

// peer(aws) vpn gateway variables
variable "peer_gw_name" {
  type        = string
  description = "name for peer(aws) vpn gateway"
}

variable "peer_gw_ips" {
  description = "ip addresses for peer(aws) vpn gateway"
}

variable "redundancy_number" {
  type    = number
  default = 4
  validation {
    condition     = var.redundancy_number == 1 || var.redundancy_number == 2 || var.redundancy_number == 4
    error_message = "Redundancy number must be 1 or 2 or 4."
  }
  description = "number of redundancy vpn gateway"
}

// gcp vpn tunnel variables
variable "vpn_connection_names" {
  type        = set(string)
  description = "(optional) describe your variable"
}

variable "ike_version" {
  type        = number
  description = "vpn ike version"
  default     = 2
}

variable "shared_secrets" {
  description = "shared secrets for vpn tunnel"
}

// gcp vpn tunnel interface variables
variable "peer_asn" {
  type        = number
  description = "peer asn for vpn tunnel session"
}

variable "gcp_bgp_ips" {
  description = "bgp ip addresses(gcp side) for vpn tunnel session"
}

variable "aws_bgp_ips" {
  description = "bgp ip addresses(aws side) for vpn tunnel session"
}
