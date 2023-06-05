<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route.route](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_ec2_local_gateways.local_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ec2_local_gateways) | data source |
| [aws_ec2_transit_gateway.transit_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ec2_transit_gateway) | data source |
| [aws_internet_gateway.egress_only_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/internet_gateway) | data source |
| [aws_internet_gateway.gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/internet_gateway) | data source |
| [aws_nat_gateways.nat_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/nat_gateways) | data source |
| [aws_network_interfaces.network_interface](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/network_interfaces) | data source |
| [aws_networkmanager_connections.core_network](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/networkmanager_connections) | data source |
| [aws_networkmanager_global_networks.global_network_for_core](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/networkmanager_global_networks) | data source |
| [aws_vpc_endpoint.vpc_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc_endpoint) | data source |
| [aws_vpc_peering_connections.vpc_peering_connection](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc_peering_connections) | data source |
| [aws_vpcs.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpcs) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_route_table_name"></a> [route\_table\_name](#input\_route\_table\_name) | Name of the route table. | `string` | `null` | no |
| <a name="input_routes"></a> [routes](#input\_routes) | n/a | <pre>list(object({<br>    destination_cidr_block = optional(string, null)<br>    destination_ipv6_cidr_block = optional(string, null)<br>    destination_prefix_list_id = optional(string, null)<br>    carrier_gateway_id = optional(string, null)<br>    core_network_name = optional(string, null)<br>    global_network_name = optional(string, null)<br>    egress_only_gateway_name = optional(string, null)<br>    gateway_name = optional(string, null)<br>    nat_gateway_name = optional(string, null)<br>    local_gateway_name = optional(string, null)<br>    network_interface_name = optional(string, null)<br>    transit_gateway_name = optional(string, null)<br>    vpc_endpoint_name = optional(string, null)<br>    vpc_peering_connection_name = optional(string, null)<br>    }))</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to the route table. | `map(string)` | `{}` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of the VPC to attach to. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_state"></a> [state](#output\_state) | n/a |
<!-- END_TF_DOCS -->