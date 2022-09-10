resource "aws_eip" "rackner_lb" {
  instance = aws_instance.rackner_nginx.id
  vpc      = true
}

resource "aws_instance" "rackner_nginx" {
  ami           = data.aws_ami.rhel_8_5.id
  instance_type = var.instance_type
  key_name      = aws_key_pair.key_pair.key_name
  subnet_id = aws_subnet.rackner_public_subnet.id
  vpc_security_group_ids = [aws_security_group.rackner_sg.id]

  user_data = file("deploy.sh")

  tags = local.tags
}

resource "local_file" "public_ip" {
  content  = aws_eip.rackner_lb.public_ip
  filename = "url.md"
}