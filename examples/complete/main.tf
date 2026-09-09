#-----------------------------------------------------------------------------------------------------------------------
# Network
#-----------------------------------------------------------------------------------------------------------------------
module "network" {
  source = "../../"

  network_name = "example-complete"
  network_cidr = "10.0.0.0/16"

  public_subnets = {
    public-1 = {
      ip_range     = "10.0.1.0/24"
      network_zone = "eu-central"
      type         = "cloud"
    }
  }

  private_subnets = {
    private-1 = {
      ip_range     = "10.0.2.0/24"
      network_zone = "eu-central"
      type         = "cloud"
    }
  }

  labels = {
    Environment = "example"
    ManagedBy   = "Terraform"
  }
}
