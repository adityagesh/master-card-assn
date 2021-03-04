resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = var.public_subnets[0].id

  tags = {
    Name        = "${var.project_name}-nat-gw-${var.environment}"
    Environment = var.environment
  }
}
