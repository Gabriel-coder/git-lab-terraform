output "public_ip" {
  description = "IP público da EC2"
  value       = aws_instance.web.public_ip
}

output "http_url" {
  description = "URL HTTP da aplicação (porta 80)"
  value       = "http://${aws_instance.web.public_ip}"
}
