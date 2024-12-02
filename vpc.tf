module "vpc" {
  source          = "terraform-aws-modules/vpc/aws"
  name            = "eks-vpc"
  cidr            = "10.0.0.0/16"   
  azs             = ["ap-south-1a", "ap-south-1b"] 
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]  
  public_subnets  = ["10.0.11.0/24", "10.0.12.0/24"]  
  enable_nat_gateway = true         
  enable_vpn_gateway = false
  enable_dns_hostnames = true

  create_igw        = true         
  enable_dns_support = true         
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnet_ids" {
  value = module.vpc.private_subnets
}

output "public_subnet_ids" {
  value = module.vpc.public_subnets
}
