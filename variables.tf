#-----------------------------------------------------------------------------------------------------------------------
# Variables
#-----------------------------------------------------------------------------------------------------------------------

variable "network_name" {
  type    = string
  default = "my-hetzner-network"
  description = "Network name"
}

variable "network_zone" {
  type    = string
  default = "eu-central"
  description = "Network zone location"
}

variable "network_cidr" {
  type    = string
  default = "10.0.0.0/16"
  description = "Network CIDR"
}

variable "public_subnets" {
  default = {}
  type = map(object({
    ip_range     = string
    network_zone = string
    type         = string
  }))
  description = "A map of public subnets inside the Network"
}

variable "private_subnets" {
  default = {}
  type = map(object({
    ip_range     = string
    network_zone = string
    type         = string
  }))
  description = "A map of private subnets inside the Network"
}

variable "labels" {
  default = {}
  type = map(string)
  description = "A map of labels to add to all resources"
}
