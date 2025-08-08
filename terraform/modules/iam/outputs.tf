output "execution_role_arn" {
  description = "ARN da role de execução do ECS"
  value       = aws_iam_role.ecs_task_execution.arn
}
