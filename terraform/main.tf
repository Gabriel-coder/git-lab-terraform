terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.3.0"
}

provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source         = "./modules/vpc"
  cidr_block     = "10.0.0.0/16"
  public_subnet1 = "10.0.1.0/24"
  public_subnet2 = "10.0.2.0/24"
  project        = "ecs-lab"
}



module "iam" {
  source = "./modules/iam"
  tags = {
    Project = "ecs-lab"
  }
}

module "security_group" {
  source  = "./modules/security_group"
  vpc_id  = module.vpc.vpc_id
  project = "ecs-lab"
}


module "load_balancer" {
  source            = "./modules/load_balancer"
  vpc_id            = module.vpc.vpc_id
  public_subnets    = module.vpc.public_subnets
  lb_sg_id          = module.security_group.sg_id
  project           = "ecs-lab"
}


module "ecs_cluster" {
  source  = "./modules/ecs_cluster"
  name    = "ecs-lab-cluster"
  project = "ecs-lab"
}


module "ecs_task_definition" {
  source             = "./modules/ecs_task_definition"
  execution_role_arn = module.iam.execution_role_arn
  image              = "gabriel1304/node-app:latest"
  container_name     = "node-app"
  container_port     = 3000
  family             = "node-app-task"
  cpu                = "256"
  memory             = "512"
}

module "ecs_service" {
  source             = "./modules/ecs_service"
  cluster_id         = module.ecs_cluster.cluster_id
  subnets            = module.vpc.public_subnets
  sg_id              = module.security_group.sg_id
  target_group_arn   = module.load_balancer.target_group_arn
  listener_arn       = module.load_balancer.listener_arn
  execution_role_arn = module.iam.execution_role_arn
  image              = "gabriel1304/node-app:latest"
  container_name     = "node-app"
  container_port     = 3000
}

