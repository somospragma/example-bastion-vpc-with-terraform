output "vpc_id" {
  value = aws_vpc.ipv6_vpc_terraform.id
}

output "vpc_ipv6_association_id" {
  description = "The association ID for the IPv6 CIDR block"
  value       = try(aws_vpc.ipv6_vpc_terraform.ipv6_association_id, "")
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = try(aws_vpc.ipv6_vpc_terraform.arn, "")
}

output "subnet_arns" {
  description = "List of ARNs of private subnets"
  value = toset([
    for subnet in aws_subnet.main_subnet : subnet.arn
  ])
}

output "subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value = toset([
    for subnet in aws_subnet.main_subnet : subnet.cidr_block
  ])

}

output "subnets_ipv6_cidr_blocks" {
  description = "List of IPv6 cidr_blocks of public subnets in an IPv6 enabled VPC"
  value = toset([
    for subnet in aws_subnet.main_subnet : subnet.ipv6_cidr_block
  ])
}

output "subnets_id" {
  value = toset([
    for subnet in aws_subnet.main_subnet : subnet.id
  ])
}

output "var_sn_web_b" {
  value = aws_subnet.main_subnet["sub-8"].id
}
