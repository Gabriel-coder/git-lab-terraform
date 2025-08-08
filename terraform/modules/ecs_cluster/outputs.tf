output "cluster_id" {
  value = aws_ecs_cluster.this.id
}


output "cluster_name" {
  description = "Nome do ECS Cluster"
  value       = aws_ecs_cluster.this.name
}
