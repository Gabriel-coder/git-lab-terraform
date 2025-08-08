resource "aws_vpc" "this" {
  cidr_block = var.cidr_block

  tags = {
    Name    = "${var.project}-vpc"
    Project = var.project
  }
}

resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.public_subnet1
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name    = "${var.project}-subnet-1"
    Project = var.project
  }
}

resource "aws_subnet" "public_2" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.public_subnet2
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"

  tags = {
    Name    = "${var.project}-subnet-2"
    Project = var.project
  }
}
