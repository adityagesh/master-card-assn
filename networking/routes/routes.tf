/* Add routes to tables */

resource "aws_route" "local" {
  route_table_id         = aws_route_table.default.id
  destination_cidr_block = var.vpc.cidr_block
}



resource "aws_route" "public-local" {
  route_table_id         = aws_route_table.public_subnet.id
  destination_cidr_block = var.vpc.cidr_block
}


resource "aws_route" "internet_gw" {
  route_table_id         = aws_route_table.public_subnet.id
  destination_cidr_block = var.destination_cidr
  gateway_id             = var.internet_gw.id
}


resource "aws_route" "nat_gw" {
  route_table_id         = aws_route_table.default.id
  destination_cidr_block = var.destination_cidr
  nat_gateway_id         = var.nat_gw.id
}
