output "aws_security_group_http_server_info" {
  value = aws_security_group.http_server_sg
}

output "aws_instance_http_server" {
  value = aws_instance.http_server
}