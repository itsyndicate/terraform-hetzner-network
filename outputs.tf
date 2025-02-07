#-----------------------------------------------------------------------------------------------------------------------
# Outputs
#-----------------------------------------------------------------------------------------------------------------------
output "network_id" {
  description = "ID of the Network resource"
  value       = hcloud_network.this.id
}

output "public_subnets" {
  value = {
    for key, subnet in local.public_subnets : key => {
      name = key
      ip_range = subnet.ip_range
    }
  }
}
