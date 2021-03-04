resource "aws_security_group" "ec2_webserver" {
  name        = "${var.project_name}-ec2-webserver-${var.environment}"
  description = "Security group for all ec2 instances"
  vpc_id      = var.vpc.id

  tags = {
    Environment = var.environment
  }

  # http incoming traffic
  ingress {
    # cidr_blocks     = var.CIDR_block_all_traffic
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [var.alb_security_group.id]
  }

  #https incoming traffic
  ingress {
    # cidr_blocks     = var.CIDR_block_all_traffic
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = [var.alb_security_group.id]
  }
  # allow all outgoing traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.CIDR_block_all_traffic
  }
}

