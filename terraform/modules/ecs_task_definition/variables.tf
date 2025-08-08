variable "execution_role_arn" {
  type        = string
  description = "ARN da role de execução do ECS"
}

variable "image" {
  type        = string
  description = "Imagem Docker do container"
}

variable "container_name" {
  type        = string
  description = "Nome do container"
}

variable "container_port" {
  type        = number
  description = "Porta exposta pelo container"
}

variable "family" {
  type        = string
  description = "Família da Task Definition"
}

variable "cpu" {
  type        = string
  description = "Quantidade de CPU"
}

variable "memory" {
  type        = string
  description = "Quantidade de memória"
}
