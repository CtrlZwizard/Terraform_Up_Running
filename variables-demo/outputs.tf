# outputs.tf

output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.example.public_ip
}

output "server_port_used" {
  description = "The port the server is listening on"
  value       = var.server_port
}

output "open_ports" {
  description = "Ports opened on the security group"
  value       = var.allowed_ports
}
