#-----------------------------------------------------------------------------------------------------------------------
# Outputs
#-----------------------------------------------------------------------------------------------------------------------
output "network_id" {
  description = "ID of the Network resource"
  value       = module.network.network_id
}

output "public_subnets" {
  description = "Map of public subnets"
  value       = module.network.public_subnets
}

output "private_subnets" {
  description = "Map of private subnets"
  value       = module.network.private_subnets
}
