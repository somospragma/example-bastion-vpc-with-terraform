provider "aws" {
  region = "${local.availability_zone}"
}

#resource "aws_instance" "ec2_instance_terraform" {
#  ami = "ami-0373218dcae329f21"
#  instance_type = "t2.micro"
#  tags = {
#    Name = "ec2-with-terraform-1"
#  }
#}

resource "aws_vpc" "ipv6_vpc_terraform" {
  cidr_block                       = "${local.vpc_ip}/${local.vpc_mask}"
  enable_dns_hostnames             = false
  assign_generated_ipv6_cidr_block = true

  tags = {
    Name = "${local.vpc_name}"
  }
}

resource "aws_subnet" "main_subnet" {
  for_each = local.sub_networks 

  vpc_id            = aws_vpc.ipv6_vpc_terraform.id
  cidr_block        = "${each.value["ip"]}/${local.sub_network_mask}"
  availability_zone = "${local.availability_zone}${each.value["zone"]}"

  ipv6_cidr_block                 = cidrsubnet(aws_vpc.ipv6_vpc_terraform.ipv6_cidr_block, 8, each.value["cidrNumber"])
  assign_ipv6_address_on_creation = local.assign_ipv6_address_subnet
  map_public_ip_on_launch         = local.map_public_ip_subnet

  tags = {
    Name = "${each.value["tagName"]}"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.ipv6_vpc_terraform.id
  tags = {
    Name = "internet_gateway_terraform"
  }
}

resource "aws_egress_only_internet_gateway" "egress_gw" {
  vpc_id = aws_vpc.ipv6_vpc_terraform.id

  tags = {
    Name = "egress_gw"
  }
}

resource "aws_route_table" "route_table_1" {
  vpc_id = aws_vpc.ipv6_vpc_terraform.id
  route {
    cidr_block      = "0.0.0.0/0"
    gateway_id      = aws_internet_gateway.gw.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.egress_gw.id
  }

  tags = {
    Name = "route_table_1"
  }
}

resource "aws_route_table_association" "table_sn_web_A" {
  subnet_id      = aws_subnet.main_subnet["sub-4"].id
  route_table_id = aws_route_table.route_table_1.id
}

resource "aws_route_table_association" "table_sn_web_B" {
  subnet_id      = aws_subnet.main_subnet["sub-8"].id
  route_table_id = aws_route_table.route_table_1.id
}

resource "aws_route_table_association" "table_sn_web_C" {
  subnet_id      = aws_subnet.main_subnet["sub-12"].id
  route_table_id = aws_route_table.route_table_1.id
}



