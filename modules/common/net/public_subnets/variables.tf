variable "subnet_name" {
  type        = string
  description = "name of subnet"
}

variable "vpc" {
  type        = string
  description = "name of vpc network"
}

variable "ip_cidr_range" {
  type        = string
  description = "ip cidr range for subnet"
}

variable "region" {
  type        = string
  description = "region for subnet"
}

variable "description" {
  type        = string
  description = "description for subnet"
}

variable "private_ip_google_access" {
  type        = bool
  default     = true
  description = "private ip google access for subnet(when enabled, resources in this subnetwork without external IP addresses can access Google APIs and services)"
}

