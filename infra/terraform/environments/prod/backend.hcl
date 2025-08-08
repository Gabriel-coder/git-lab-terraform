bucket         = "meu-tfstate-prod"        # TODO: troque
key            = "infra/prod/terraform.tfstate"
region         = "us-east-1"
dynamodb_table = "meu-tflock-prod"         # TODO: troque
encrypt        = true
