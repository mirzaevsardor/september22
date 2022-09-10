output "nginx_ip" {
  value = aws_instance.rackner_nginx.public_ip
}