module "vpc" {
  source               = "terraform-aws-modules/vpc/aws"
  version              = "6.6.0"
  name                 = "terraform-vpc-2"
  cidr                 = "10.0.0.0/16"
  azs                  = ["us-east-1a", "us-east-1b"]
  public_subnets       = ["10.0.101.0/24", "10.0.102.0/24"]
  enable_vpn_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
module "terraform-sg" {
  source              = "terraform-aws-modules/security-group/aws"
  version             = "5.3.1"
  name                = "super regla https"
  description         = "Security Group creado por Pepito"
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["https-443-tcp"]
  egress_cidr_blocks  = ["0.0.0.0/0"]
  egress_rules        = ["https-443-tcp"]
}
