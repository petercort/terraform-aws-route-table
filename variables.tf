variable "route_table_name" {
  type        = string
  description = "Name of the route table."
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC to attach to."
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the route table."
  default     = {}
}

variable "routes" {
  type = list(object({
    destination_cidr_block = optional(string, null)
    destination_ipv6_cidr_block = optional(string, null)
    destination_prefix_list_id = optional(string, null)
    carrier_gateway_id = optional(string, null)
    core_network_name = optional(string, null)
    global_network_name = optional(string, null)
    egress_only_gateway_name = optional(string, null)
    gateway_name = optional(string, null)
    nat_gateway_name = optional(string, null)
    local_gateway_name = optional(string, null)
    network_interface_name = optional(string, null)
    transit_gateway_name = optional(string, null)
    vpc_endpoint_name = optional(string, null)
    vpc_peering_connection_name = optional(string, null)
    }))
  description = "Provides a resource to create a routing table entry (a route) in a VPC routing table."
}
