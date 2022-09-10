resource "aws_security_group" "rackner_sg" {

  vpc_id = aws_vpc.rackner_vpc.id
  name   = var.sg_name

  dynamic "ingress" {
    for_each = var.ports_ingress
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {

      from_port   = 0
      to_port     = 65535
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
}

