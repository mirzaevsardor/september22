locals {
  tags = {
    Name = "Rackner_assesment"
    Owner   = "Sarge"
    Purpose = "code_assesment"
  }
}

resource "aws_vpc" "rackner_vpc" {

  cidr_block                       = var.cidr
  enable_dns_hostnames             = var.enable_dns_hostnames
  enable_dns_support               = var.enable_dns_support
  assign_generated_ipv6_cidr_block = var.enable_ipv6

  tags = local.tags
}

resource "aws_subnet" "rackner_public_subnet" {
  vpc_id     = aws_vpc.rackner_vpc.id
  cidr_block = "10.0.0.0/24"

  tags = local.tags
}

resource "aws_subnet" "rackner_private_subnet" {
  vpc_id     = aws_vpc.rackner_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = local.tags
}



resource "aws_internet_gateway" "rackner_ig" {
  vpc_id = aws_vpc.rackner_vpc.id

  tags = local.tags
}

resource "aws_route_table" "rackner_rt" {
  vpc_id = aws_vpc.rackner_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.rackner_ig.id
  }

  tags = local.tags
}

resource "aws_route_table_association" "public_ip" {
  subnet_id      = aws_subnet.rackner_public_subnet.id
  route_table_id = aws_route_table.rackner_rt.id
}

resource "aws_route_table_association" "private_ip" {
  subnet_id      = aws_subnet.rackner_private_subnet.id
  route_table_id = aws_route_table.rackner_rt.id
}