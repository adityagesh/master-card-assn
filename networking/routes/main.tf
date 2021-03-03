/* Routing tables */
resource "aws_route_table" "default" {
  vpc_id = var.vpc.id
  tags = {
    Name        = "default"
    Environment = var.environment
  }
}

resource "aws_route_table" "public_subnet" {
  vpc_id = var.vpc.id
  tags = {
    Name        = "public-subnet"
    Environment = var.environment
  }
}


/* Routing table association to vpc */

resource "aws_main_route_table_association" "default" {
  vpc_id         = var.vpc.id
  route_table_id = aws_route_table.default.id
}

resource "aws_route_table_association" "public" {
  count          = length(var.public_subnets)
  subnet_id      = var.public_subnets[count.index].id
  route_table_id = aws_route_table.public_subnet.id
}


