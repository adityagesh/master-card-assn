resource "aws_lb" "webserver" {
  name               = "${var.project_name}-alb-${var.environment}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = var.public_subnets.*.id

  enable_deletion_protection = false

  # subnet_mapping {
  #   subnet_id = var.public_subnets[0].id
  # }

  tags = {
    Environment = var.environment
  }
}


resource "aws_lb_target_group" "webserver" {
  name     = "${var.project_name}-tg-${var.environment}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc.id
}


# resource "aws_lb_listener" "webserver_front_end" {
#   load_balancer_arn = aws_lb.webserver.arn
#   port              = "443"
#   protocol          = "HTTPS"
#   ssl_policy        = "ELBSecurityPolicy-2016-08"
#   certificate_arn   = aws_acm_certificate.cert.arn

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.webserver.arn
#   }
# }

resource "aws_lb_listener" "webserver_front_end" {
  load_balancer_arn = aws_lb.webserver.arn
  port              = "80"
  protocol          = "HTTP"
  # ssl_policy        = "ELBSecurityPolicy-2016-08"
  # certificate_arn   = aws_acm_certificate.cert.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.webserver.arn
  }
}
