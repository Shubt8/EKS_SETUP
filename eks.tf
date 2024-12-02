module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "my-cluster"
  cluster_version = "1.31"
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnets

  eks_managed_node_groups = {
    eks-ec2 = {
      instance_types = ["t2.micro"]  
      min_size       = 1
      max_size       = 2
      desired_size   = 1
    }
  }

  cluster_endpoint_public_access = true
}
