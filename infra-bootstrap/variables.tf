variable "region" {
  type    = string
  default = "us-east-1"
}

variable "project_prefix" {
  type        = string
  description = "Prefixo dos recursos (ex: gitlab)"
}

variable "unique_suffix" {
  type        = string
  description = "Sufixo único p/ nomes globais (ex: rodrigo123)"
}

variable "repo_owner" {
  type        = string
  description = "Dono/org do GitHub (ex: rodrigomello)"
}

variable "repo_name" {
  type        = string
  description = "Repositório (ex: git-lab)"
}

# Para lab use Admin; em produção troque por uma política mínima
variable "role_policy_arn" {
  type    = string
  default = "arn:aws:iam::aws:policy/AdministratorAccess"
}
