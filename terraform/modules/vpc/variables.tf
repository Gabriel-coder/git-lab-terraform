variable "cidr_block" {
  description = "CIDR da VPC"
  type        = string
}

variable "public_subnet1" {
  description = "CIDR da Subnet pública 1"
  type        = string
}

variable "public_subnet2" {
  description = "CIDR da Subnet pública 2"
  type        = string
}

variable "project" {
  description = "Nome do projeto"
  type        = string
}
