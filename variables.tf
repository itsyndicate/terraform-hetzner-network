#-----------------------------------------------------------------------------------------------------------------------
# Variables
#-----------------------------------------------------------------------------------------------------------------------

variable "network_name" {
  description = "Network name"
  type        = string
  default     = "my-hetzner-network"
}

variable "network_cidr" {
  description = "Network CIDR"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "A map of public subnets inside the Network"
  type = map(object({
    ip_range     = string
    network_zone = string
    type         = string
  }))
  default = {}
}

variable "private_subnets" {
  description = "A map of private subnets inside the Network"
  type = map(object({
    ip_range     = string
    network_zone = string
    type         = string
  }))
  default = {}
}

variable "labels" {
  description = "A map of labels to add to all resources"
  type        = map(string)
  default     = {}
}
