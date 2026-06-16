# variables.tf

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}

variable "allowed_cidr_blocks" {
  description = "List of CIDR blocks allowed to reach the server"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "allowed_ports" {
  description = "List of ports to open on the security group"
  type        = list(number)
  default     = [8080]
}
