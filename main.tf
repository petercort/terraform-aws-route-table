data "aws_networkmanager_global_networks" "global_network_for_core" {
  for_each = { for index, route in var.routes : index => route.global_network_name if route.global_network_name != null }

  tags = {
    Name = each.value.global_network_name
  }
}
data "aws_networkmanager_connections" "core_network" {
  for_each = { for index, route in var.routes : index => route.core_network_name if route.core_network_name != null }
  global_network_id = data.aws_networkmanager_global_networks.global_network_for_core[each.value.global_network_name].ids.0

  tags = {
    Name = each.value.core_network_name
  }
}

data "aws_internet_gateway" "egress_only_gateway" {
  for_each = { for index, route in var.routes : index => route.egress_only_gateway_name if route.egress_only_gateway_name != null}

  filter {
    name = "tag:Name"
    values = [each.value.egress_only_gateway_name]
  }
}
data "aws_internet_gateway" "gateway" {
  for_each = { for index, route in var.routes : index => route.gateway_name if route.gateway_name != null}

  filter {
    name = "tag:Name"
    values = [each.value.gateway_name]
  }
}
data "aws_ec2_local_gateways" "local_gateway" {
  for_each = { for index, route in var.routes : index => route.local_gateway_name if route.local_gateway_name != null}

  filter {
    name = "tag:Name"
    values = [each.value.local_gateway_name]
  }
}
data "aws_nat_gateways" "nat_gateway" {
  for_each = { for index, route in var.routes : index => route.nat_gateway_name if route.nat_gateway_name != null}

  filter {
    name = "tag:Name"
    values = [each.value]
  }
}

data "aws_network_interfaces" "network_interface" {
  for_each = { for index, route in var.routes : index => route.network_interface_name if route.network_interface_name != null}

  filter {
    name = "tag:Name"
    values = [each.value.network_interface_name]
  }
}
data "aws_ec2_transit_gateway" "transit_gateway" {
  for_each = { for index, route in var.routes : index => route.transit_gateway_name if route.transit_gateway_name != null}

  filter {
    name = "tag:Name"
    values = [each.value.transit_gateway_name]
  }
}
data "aws_vpc_endpoint" "vpc_endpoint" {
  for_each = { for index, route in var.routes : index => route.vpc_endpoint_name if route.vpc_endpoint_name != null}
  vpc_id = var.vpc_id
  filter {
    name = "tag:Name"
    values = [each.value.vpc_endpoint_name]
  }
}
data "aws_vpc_peering_connections" "vpc_peering_connection" {
  for_each = { for index, route in var.routes : index => route.vpc_peering_connection_name if route.vpc_peering_connection_name != null}

  filter {
    name = "tag:Name"
    values = [each.value.vpc_peering_connection_name]
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = var.vpc_id
  tags = merge(tomap({ Name = var.route_table_name }), var.tags)
}


resource "aws_route" "route" {
  for_each = { for index, route in var.routes : index => route}
  route_table_id              = aws_route_table.route_table.id
  destination_cidr_block = each.value.destination_cidr_block
  destination_ipv6_cidr_block = each.value.destination_ipv6_cidr_block
  destination_prefix_list_id = each.value.destination_prefix_list_id

  carrier_gateway_id = each.value.carrier_gateway_id == null ? null : each.value.carrier_gateway_id
  core_network_arn = each.value.core_network_name == null ? null : data.aws_networkmanager_connections.core_network[each.key].ids.0
  egress_only_gateway_id = each.value.egress_only_gateway_name == null ? null : data.aws_internet_gateway.egress_only_gateway[each.key].ids.0
  gateway_id = each.value.gateway_name == null ? null : data.aws_internet_gateway.gateway[each.key].ids.0
  local_gateway_id = each.value.local_gateway_name == null ? null : data.aws_ec2_local_gateways.local_gateway[each.key].ids.0
  nat_gateway_id = each.value.nat_gateway_name == null ? null : data.aws_nat_gateways.nat_gateway[each.key].ids.0
  network_interface_id = each.value.network_interface_name == null ? null : data.aws_network_interfaces.network_interface[each.key].ids.0
  transit_gateway_id = each.value.transit_gateway_name == null ? null : data.aws_ec2_transit_gateway.transit_gateway[each.key].ids.0
  vpc_endpoint_id = each.value.vpc_endpoint_name == null ? null : data.aws_vpc_endpoint.vpc_endpoint[each.key].ids.0
  vpc_peering_connection_id = each.value.vpc_peering_connection_name == null ? null : data.aws_vpc_peering_connections.vpc_peering_connection[each.key].ids.0
}