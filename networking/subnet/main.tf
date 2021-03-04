resource "aws_subnet" "public" {
  count                   = length(var.CIDR_pub)
  vpc_id                  = var.vpc.id
  cidr_block              = var.CIDR_pub[count.index]
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  # map_public_ip_on_launch = true
  tags = {
    Name        = "${var.project_name}-public-${count.index}"
    Environment = var.environment
  }
}


resource "aws_subnet" "private" {
  count             = length(var.CIDR_pvt)
  vpc_id            = var.vpc.id
  cidr_block        = var.CIDR_pvt[count.index]
  availability_zone = element(data.aws_availability_zones.available.names, count.index)

  tags = {
    Name        = "${var.project_name}-private-${count.index}"
    Environment = var.environment
  }
}

