output "target_group_arn" {
  description = "ARN do target group"
  value       = aws_lb_target_group.this.arn
}

output "load_balancer_arn" {
  description = "ARN do Load Balancer"
  value       = aws_lb.this.arn
}

output "listener_arn" {
  description = "ARN do listener HTTP"
  value       = aws_lb_listener.http.arn
}

output "lb_dns_name" {
  description = "DNS público do Load Balancer"
  value       = aws_lb.this.dns_name
}
