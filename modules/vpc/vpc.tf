resource "aws_vpc" "ipv6_vpc_terraform" {
  cidr_block                       = var.vpc_cidr
  enable_dns_hostnames             = true
  assign_generated_ipv6_cidr_block = true
  instance_tenancy                 = var.tenancy

  tags = {
    Name = "${var.vpc_name}"
    "kubernetes.io/cluster/${var.eks_cluster_name}-cluster" = "shared"
  }
}
