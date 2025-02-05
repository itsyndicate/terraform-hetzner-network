# terraform-hetzner-network

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | 1.49.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | 1.49.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [hcloud_network.this](https://registry.terraform.io/providers/hetznercloud/hcloud/1.49.1/docs/resources/network) | resource |
| [hcloud_network_subnet.private](https://registry.terraform.io/providers/hetznercloud/hcloud/1.49.1/docs/resources/network_subnet) | resource |
| [hcloud_network_subnet.public](https://registry.terraform.io/providers/hetznercloud/hcloud/1.49.1/docs/resources/network_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_labels"></a> [labels](#input\_labels) | A map of labels to add to all resources | `map(string)` | `{}` | no |
| <a name="input_network_cidr"></a> [network\_cidr](#input\_network\_cidr) | Network CIDR | `string` | `"10.0.0.0/16"` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Network name | `string` | `"my-hetzner-network"` | no |
| <a name="input_network_zone"></a> [network\_zone](#input\_network\_zone) | Network zone location | `string` | `"eu-central"` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | A map of private subnets inside the Network | <pre>map(object({<br/>    ip_range     = string<br/>    network_zone = string<br/>    type         = string<br/>  }))</pre> | `{}` | no |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | A map of public subnets inside the Network | <pre>map(object({<br/>    ip_range     = string<br/>    network_zone = string<br/>    type         = string<br/>  }))</pre> | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->