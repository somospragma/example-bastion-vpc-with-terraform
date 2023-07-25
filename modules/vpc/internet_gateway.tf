resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.ipv6_vpc_terraform.id
  tags = {
    Name = "internet_gateway_terraform"
  }
}
