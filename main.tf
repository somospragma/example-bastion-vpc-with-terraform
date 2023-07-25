provider "aws" {
  region = local.availability_zone
}

module "vpc" {
  source     = "./modules/vpc"
  vpc_cidr   = "${local.vpc_ip}/${local.vpc_mask}"
  tenancy    = "default"
  vpc_id     = "${module.vpc.vpc_id}"
}

module "first-ec2" {
  source            = "./modules/ec2-instances"
  subnet_id_target  = module.vpc.var_sn_web_b
  sg_ssh_id         = module.vpc.aws_security_group_ssh
  sg_web_is         = module.vpc.aws_security_group_web
}

