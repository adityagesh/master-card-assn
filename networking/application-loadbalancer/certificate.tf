resource "aws_acm_certificate" "cert" {
  domain_name       = aws_lb.webserver.dns_name
  validation_method = "DNS"

  tags = {
    Environment = var.environment
  }

  lifecycle {
    create_before_destroy = true
  }
}
