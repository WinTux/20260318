terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "mi_servidor" {
  ami           = "ami-0ec10929233384c7f"
  instance_type = "t3.micro"
  tags = {
    Name = "ServidorTerraform"
  }
}
