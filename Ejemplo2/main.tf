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

#data "aws_subnet" "default" {
#  default_for_az = true
#}

resource "aws_instance" "mi_servidor" {
  for_each = var.nombres_servicios
  ami           = "ami-0ec10929233384c7f"
  instance_type = "t3.micro"
  subnet_id = "subnet-0ec43cfc20f6562ea"
  #subnet_id = data.aws_subnets.default.ids[0]
  tags = {
    Name = "ServidorTerraform-${each.key}"
    Environment = "Dev"
    Owner = "Pepito"
  }
}
