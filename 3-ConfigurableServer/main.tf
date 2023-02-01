variable "server_port" {
	description = "The port the server will use for HTTP requests"
	type = number
	default = 8080
}

output "public_ip" {
	value = aws_instance.example.public_ip
	description = "The public IP address of the web server"
}

provider "aws" {
	region = "eu-west-3"
}

resource "aws_instance" "example" {
	ami = "ami-0afd55c0c8a52973a"
	instance_type = "t2.micro"
	vpc_security_group_ids = [aws_security_group.sg_webServer.id]
	user_data = <<-EOF
		#!/bin/bash
		echo "Hello, World" > index.html
		nohup busybox httpd -f -p ${var.server_port} &
		EOF

	tags = {
		Name = "SingleWebServerWithParameters"
	}

}

resource "aws_security_group" "sg_webServer" {
	name = "terraform-example-instance"

	ingress {
		from_port = var.server_port
		to_port = var.server_port
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
}