#-----------------------------------------------------------------------------------------------------------------------
# Outputs
#-----------------------------------------------------------------------------------------------------------------------
output "network_id" {
  description = "ID of the Network resource"
  value       = hcloud_network.this.id
}

output "public_subnets" {
  description = "Map of public subnets, keyed by the key given in var.public_subnets"
  value = {
    for key, subnet in hcloud_network_subnet.public : key => {
      name     = key
      id       = subnet.id
      ip_range = subnet.ip_range
    }
  }
}

output "private_subnets" {
  description = "Map of private subnets, keyed by the key given in var.private_subnets"
  value = {
    for key, subnet in hcloud_network_subnet.private : key => {
      name     = key
      id       = subnet.id
      ip_range = subnet.ip_range
    }
  }
}
