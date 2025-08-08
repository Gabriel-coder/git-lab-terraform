locals {
  envs = ["dev", "hom", "prod"]
}

# ---------- OIDC provider do GitHub ----------
data "tls_certificate" "github" {
  url = "https://token.actions.githubusercontent.com"
}

resource "aws_iam_openid_connect_provider" "github" {
  url             = "https://token.actions.githubusercontent.com"
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.github.certificates[0].sha1_fingerprint]
}

# ---------- S3 + DynamoDB por ambiente ----------
resource "aws_s3_bucket" "tfstate" {
  for_each = toset(local.envs)
  bucket   = "${var.project_prefix}-${each.key}-tfstate-${var.unique_suffix}"
}

resource "aws_s3_bucket_versioning" "tfstate" {
  for_each = aws_s3_bucket.tfstate
  bucket   = each.value.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tfstate" {
  for_each = aws_s3_bucket.tfstate
  bucket   = each.value.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "tfstate" {
  for_each                = aws_s3_bucket.tfstate
  bucket                  = each.value.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_dynamodb_table" "tflock" {
  for_each     = toset(local.envs)
  name         = "${var.project_prefix}-${each.key}-tflock-${var.unique_suffix}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

# ---------- IAM Role por ambiente (assumido via OIDC) ----------
data "aws_iam_policy_document" "oidc_trust" {
  for_each = toset(local.envs)

  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.github.arn]
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }

    # repo específico e branch main (ajuste se quiser liberar tags)
    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values   = ["repo:${var.repo_owner}/${var.repo_name}:ref:refs/heads/main"]
    }
  }
}

resource "aws_iam_role" "gha" {
  for_each           = toset(local.envs)
  name               = "${var.project_prefix}-${each.key}-gha-oidc"
  path               = "/github-oidc/"
  assume_role_policy = data.aws_iam_policy_document.oidc_trust[each.key].json
}

resource "aws_iam_role_policy_attachment" "gha_attach" {
  for_each   = aws_iam_role.gha
  role       = each.value.name
  policy_arn = var.role_policy_arn
}
