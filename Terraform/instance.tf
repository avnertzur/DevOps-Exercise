# EC2 Instance
resource "aws_instance" "my_instance" {
  ami                          = "ami-0a0e5d9c7acc336f1"
  instance_type                = "t2.micro"
  subnet_id                    = aws_subnet.external.id
  vpc_security_group_ids       = [aws_security_group.external_sg.id]
  associate_public_ip_address  = true

  user_data = <<-EOF
              #!/bin/bash
              mkdir -p /home/ubuntu/.ssh
              echo "${file("${local.effective_public_key_path}")}" >> /home/ubuntu/.ssh/authorized_keys
              chown -R ubuntu:ubuntu /home/ubuntu/.ssh
              chmod 700 /home/ubuntu/.ssh
              chmod 600 /home/ubuntu/.ssh/authorized_keys
              EOF

  tags = {
    Name = "my_instance"
  }
}

# Output the public IP
output "instance_public_ip" {
  value = aws_instance.my_instance.public_ip
}