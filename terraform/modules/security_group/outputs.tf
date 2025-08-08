output "lb_sg_id" {
  description = "Security Group ID do Load Balancer"
  value       = aws_security_group.lb.id
}

output "ecs_tasks_sg_id" {
  description = "Security Group ID das ECS Tasks"
  value       = aws_security_group.ecs_tasks.id
}

output "sg_id" {
  description = "Security Group ID padrão para ser usado em outros módulos"
  value       = aws_security_group.lb.id
}
