output "instance_ip" {
  value = aws_instance.application.public_ip
}