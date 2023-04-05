terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "app_server" {
  count         = 2
  ami           = "ami-0a261c0e5f51090b1"
  instance_type = "t2.micro"

  tags = {
    # Name = "FirstEc2-Instance"
    Name = var.instance_name
  }
}