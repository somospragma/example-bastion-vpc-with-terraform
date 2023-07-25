locals {
  instance_type              = var.instance_type == null ? "t2.micro" : var.instance_type
  minimum_instances          = var.minimum_instances == null ? 1 : var.minimum_instances
  maximum_instances          = var.maximum_instances == null ? 1 : var.maximum_instances
  desired_instances          = var.desired_instances == null ? 1 : var.desired_instances
  availability_zone          = var.availability_zone == null ? "us-east-1" : var.availability_zone
  sub_network_mask           = var.sub_network_mask == null ? "20" : var.sub_network_mask
  vpc_ip                     = var.vpc_ip == null ? "10.16.0.0" : var.vpc_ip
  vpc_mask                   = var.vpc_mask == null ? "16" : var.vpc_mask
}
