# main.tf

provider "aws" {
  region = "us-east-2"
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  dynamic "ingress" {
    for_each = var.allowed_ports              # iterates over list(number)
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = var.allowed_cidr_blocks  # uses list(string)
    }
  }
}

resource "aws_instance" "example" {
  ami           = "ami-0fb653ca2d3203ac1"
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = <<-EOF
    #!/bin/bash
    echo "Hello, World" > index.html
    nohup busybox httpd -f -p ${var.server_port} &
  EOF

  user_data_replace_on_change = true

  tags = {
    Name = "terraform-example"
  }
}
