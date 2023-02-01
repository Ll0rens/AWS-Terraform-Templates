provider "aws" {
	region = "eu-west-3"
}

resource "aws_instance" "example" {
	ami = "ami-0afd55c0c8a52973a"
	instance_type = "t2.micro"


	tags = {
		Name = "SingleEC2"
	}	

}

