variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

# Use um caminho CONSTANTE (sem ${...}) e relativo ao módulo
variable "user_data_path" {
  description = "Caminho do user_data.sh (relativo ao módulo)"
  type        = string
  default     = "../bootstrap/user_data.sh"
}

variable "allow_ssh_cidr" {
  description = "CIDR liberado para SSH (22)"
  type        = string
  default     = "0.0.0.0/0"
}
