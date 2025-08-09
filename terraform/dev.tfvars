project         = "git-lab"
environment     = "dev"
vpc_cidr        = "10.0.0.0/16"
public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.11.0/24", "10.0.12.0/24"]

app_name        = "node-app"
docker_image    = "gabriel1304/node-app:latest"
desired_count   = 1
