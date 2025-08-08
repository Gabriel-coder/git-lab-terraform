output "vpc_id" {
  description = "ID da VPC criada"
  value       = aws_vpc.this.id
}

output "public_subnets" {
  description = "IDs dos subnets públicos"
  value       = [aws_subnet.public_1.id, aws_subnet.public_2.id]
}
