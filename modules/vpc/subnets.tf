resource "aws_subnet" "main_subnet" {
  for_each = var.sub_networks
  
  vpc_id            = "${aws_vpc.ipv6_vpc_terraform.id}"
  cidr_block        = "${each.value["ip"]}/${var.sub_network_mask}"
  availability_zone = "${var.availability_zone}${each.value["zone"]}"

  ipv6_cidr_block                 = cidrsubnet(aws_vpc.ipv6_vpc_terraform.ipv6_cidr_block, 8, index(keys(var.sub_networks), each.key) + 1)
  assign_ipv6_address_on_creation = each.value["tagName"] == "sn_web_A" || each.value["tagName"] == "sn_web_B" || each.value["tagName"] == "sn_web_C" ? true: false
  map_public_ip_on_launch         = each.value["tagName"] == "sn_web_A" || each.value["tagName"] == "sn_web_B" || each.value["tagName"] == "sn_web_C" ? true: false

  tags = {
    Name   = "${each.value["tagName"]}"
  }
}