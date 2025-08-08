variable "vpc_id" {
  description = "ID da VPC onde o Load Balancer será criado"
  type        = string
}

variable "public_subnets" {
  description = "Lista de subnets públicas para o Load Balancer"
  type        = list(string)
}

variable "lb_sg_id" {
  description = "ID do security group para o Load Balancer"
  type        = string
}

variable "project" {
  description = "Nome do projeto"
  type        = string
}
