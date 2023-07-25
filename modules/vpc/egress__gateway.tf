resource "aws_egress_only_internet_gateway" "egress_gw" {
  vpc_id = aws_vpc.ipv6_vpc_terraform.id

  tags = {
    Name = "egress_gw"
  }
}