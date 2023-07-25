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