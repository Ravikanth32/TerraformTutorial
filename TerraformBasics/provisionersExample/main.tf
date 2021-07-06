terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.3"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0ab4d1e9cf9a1215a"
  instance_type = "t2.micro"
  key_name = "RaviAccount"
  associate_public_ip_address = true
  # vpc_security_group_ids = [aws_security_group.web-sg.id]
  //security_groups = [aws_security_group.web-sg.id]
  tags = {
    "Name" = "web-vm"
  }

}

resource "aws_security_group" "web-sg" {
  name        = "webSG"
  description = "Allow ssh  inbound traffic"
  
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    
  }

  tags = {
    Name = "webSG"
  }
}
