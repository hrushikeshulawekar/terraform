output "instance_ip" {
    value = aws_instance.my-server.public_dns
  
}

output "instance_type" {
    value = aws_instance.my-server.instance_type
  
}
