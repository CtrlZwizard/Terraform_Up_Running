# outputs.tf
output "server_port_used" {
  description = "The port the server is listening on"
  value       = var.server_port
}

output "open_ports" {
  description = "Ports opened on the security group"
  value       = var.allowed_ports
}