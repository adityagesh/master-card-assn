resource "aws_internet_gateway" "gw" {
  vpc_id = var.vpc.id

  tags = {
    Name        = "${var.project_name}-igw"
    Environment = var.environment
  }
}
