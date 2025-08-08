variable "cluster_id" {
  description = "ID do ECS Cluster"
  type        = string
}

variable "subnets" {
  description = "Lista de subnets públicas"
  type        = list(string)
}

variable "sg_id" {
  description = "ID do Security Group"
  type        = string
}

variable "target_group_arn" {
  description = "ARN do Target Group"
  type        = string
}

variable "listener_arn" {
  description = "ARN do Load Balancer Listener"
  type        = string
}

variable "execution_role_arn" {
  description = "ARN da role de execução do ECS"
  type        = string
}

variable "image" {
  description = "Imagem Docker da aplicação"
  type        = string
}

variable "container_name" {
  description = "Nome do container"
  type        = string
}

variable "container_port" {
  description = "Porta exposta no container"
  type        = number
}
