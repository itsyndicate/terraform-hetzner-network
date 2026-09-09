mock_provider "hcloud" {
  # The generated id must convert to a number: hcloud_network_subnet.network_id takes one.
  mock_resource "hcloud_network" {
    defaults = {
      id = "12345"
    }
  }
}

run "names_the_network_from_the_variables" {
  command = plan

  variables {
    network_name = "test-network"
    network_cidr = "10.1.0.0/16"
  }

  assert {
    condition     = hcloud_network.this.name == "test-network"
    error_message = "The network takes its name from var.network_name"
  }

  assert {
    condition     = hcloud_network.this.ip_range == "10.1.0.0/16"
    error_message = "The network takes its range from var.network_cidr"
  }
}

run "creates_no_subnet_for_an_empty_map" {
  command = plan

  variables {
    network_name    = "test-network"
    public_subnets  = {}
    private_subnets = {}
  }

  assert {
    condition     = length(hcloud_network_subnet.public) == 0
    error_message = "An empty public_subnets map creates no subnet"
  }

  assert {
    condition     = length(hcloud_network_subnet.private) == 0
    error_message = "An empty private_subnets map creates no subnet"
  }
}

run "keys_every_subnet_by_its_map_key" {
  command = apply

  variables {
    network_name = "test-network"

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
  }

  assert {
    condition     = keys(output.public_subnets) == ["public-1"]
    error_message = "The public_subnets output keys on the input map key"
  }

  assert {
    condition     = output.private_subnets["private-1"].ip_range == "10.0.2.0/24"
    error_message = "The private_subnets output carries the subnet range"
  }

  assert {
    condition     = output.public_subnets["public-1"].name == "public-1"
    error_message = "The subnet name repeats the map key"
  }
}
