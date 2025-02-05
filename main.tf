#-----------------------------------------------------------------------------------------------------------------------
# Network
#-----------------------------------------------------------------------------------------------------------------------
resource "hcloud_network" "this" {
  name     = var.network_name
  ip_range = var.network_cidr
  labels   = var.labels
}


#-----------------------------------------------------------------------------------------------------------------------
# Public Subnets
#-----------------------------------------------------------------------------------------------------------------------
resource "hcloud_network_subnet" "public" {
  for_each = var.public_subnets

  ip_range     = each.value.ip_range
  network_zone = each.value.network_zone
  type         = each.value.type

  network_id = hcloud_network.this.id
}


#-----------------------------------------------------------------------------------------------------------------------
# Private Subnets
#-----------------------------------------------------------------------------------------------------------------------
resource "hcloud_network_subnet" "private" {
  for_each = var.private_subnets

  ip_range     = each.value.ip_range
  network_zone = each.value.network_zone
  type         = each.value.type

  network_id = hcloud_network.this.id
}
