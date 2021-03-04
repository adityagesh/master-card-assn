output "alb_target_group" {
  value = aws_lb_target_group.webserver
}

output "alb_security_group" {
  value = aws_security_group.alb
}

output "aws_lb_webserver_dns" {
  value = aws_lb.webserver.dns_name
}