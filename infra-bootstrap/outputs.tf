output "s3_tfstate_buckets" {
  value = { for k, b in aws_s3_bucket.tfstate : k => b.bucket }
}
output "dynamodb_tables" {
  value = { for k, t in aws_dynamodb_table.tflock : k => t.name }
}
output "github_oidc_provider_arn" {
  value = aws_iam_openid_connect_provider.github.arn
}
output "gha_role_arns" {
  value = { for k, r in aws_iam_role.gha : k => r.arn }
}
