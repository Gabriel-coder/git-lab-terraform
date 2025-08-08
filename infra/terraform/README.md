# Infra Terraform

- Estrutura por ambientes: `infra/terraform/environments/{dev,hom,prod}`
- Workflows:
  - `terraform-plan.yml`: roda em PR (fmt/validate/plan) SEM apply.
  - `terraform-apply.yml`: manual (`workflow_dispatch`), com gate por ambiente (dev/hom/prod) e requer aprovação.

## OIDC (sem chaves)
Configure um role na AWS para ser assumido pelo GitHub OIDC.
No repositório GitHub, crie o secret:
- `AWS_OIDC_ROLE_ARN` = arn do role para OIDC (trust em token.actions.githubusercontent.com)
Opcional:
- `AWS_REGION` (default "us-east-1")

## Backend remoto
Quando tiver S3/DynamoDB prontos, habilite o backend:
- Descomente o bloco `terraform { backend "s3" {} }` no providers.tf do ambiente
- Passe `-backend-config=backend.hcl` no init (os workflows já mostram como).

