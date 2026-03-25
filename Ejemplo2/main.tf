terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

locals {
  nombre_workspace = terraform.workspace
}

provider "aws" {
  region = var.aws_region
}

#data "aws_subnet" "default" {
#  default_for_az = true
#}

resource "aws_instance" "mi_servidor" {
  #for_each      = var.nombres_servicios
  count = terraform.workspace == "produccion" ? 2 : 1
  ami           = "ami-0ec10929233384c7f"
  instance_type = "t3.micro"
  #subnet_id = "subnet-0ec43cfc20f6562ea"
  #subnet_id = data.aws_subnets.default.ids[0]
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [module.terraform-sg.security_group_id]
  associate_public_ip_address = true
  tags = {
    #Name        = "ServidorTerraform-${each.key}"
    Name = format("%s-%s",terraform.workspace,count.index)
    Environment = "Dev"
    Owner       = "Pepito"
  }
}

resource "aws_cloudwatch_log_group" "grupo_log_ec2" {
  for_each = var.nombres_servicios
  tags = {
    Environment = "Dev"
    Servicio    = each.key
  }
  lifecycle {
    create_before_destroy = true
  }
}
