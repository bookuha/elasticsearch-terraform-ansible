provider "aws" {
  region = "eu-north-1"
}


module "vpc" {
  source = "./modules/vpc"

  vpc_cidr      = "10.70.0.0/16"
  public_subnet = "10.70.1.0/24"
}

# EC2 Module
module "ec2" {
  source = "./modules/ec2"

  vpc_id        = module.vpc.vpc_id
  subnet_id     = module.vpc.public_subnet_id
}
