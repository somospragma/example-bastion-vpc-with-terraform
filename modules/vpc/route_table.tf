resource "aws_route_table" "route_table_1" {
  vpc_id = aws_vpc.ipv6_vpc_terraform.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.egress_gw.id
  }

  tags = {
    Name = "route_table_1"
  }
}