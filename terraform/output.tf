output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "load_balancer_dns_name" {
  value = module.load_balancer.lb_dns_name
}
