variable "fw_name" {
  type = string
  description = "firewall name"
  default = "allow-example-fw"
}

variable "fw_description" {
  type = string
  description = "firewall description"
  default = "allow example firewall"
}

variable "fw_source_ranges" {
  type = list(string)
  description = "firewall source ranges"
  default = []
}
