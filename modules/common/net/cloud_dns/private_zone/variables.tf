variable "project_id" {
  type        = string
  description = "project id"
}

variable "dns_name" {
  type        = string
  description = "dns name for private dns zone"
}

variable "description" {
  type        = string
  description = "description for private dns zone"
}

variable "network_ids" {
  type        = list(string)
  description = "network ids attached to private dns zone"
}

variable "records" {
  type = list(object({
    name   = string
    type   = string
    ttl    = number
    values = list(string)
  }))
  description = "records for private dns zone"
}

variable "labels" {
  type        = map(string)
  description = "labels for private dns zone"
}
