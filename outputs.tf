output "id" {
  value = aws_route_table.route_table.id
}

output "state" {
  value = {
    for k, v in var.routes : k => aws_route.route[k].state
  }
}

