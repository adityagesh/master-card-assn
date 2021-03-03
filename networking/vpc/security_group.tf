resource "aws_security_group" "vpc-security-group" {
  vpc_id = aws_vpc.main.id
  name   = "${var.project_name}-vpc-sec-grp"

  tags = {
    environment = var.environment
  }
}
