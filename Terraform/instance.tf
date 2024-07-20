resource "aws_instance" "application" {
  key_name                    = aws_key_pair.generated_key.key_name
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  vpc_security_group_ids      = ["${aws_security_group.external_connection_sg.id}", "${aws_security_group.internal_connection_sg.id}"]
  subnet_id                   = module.vpc.public_subnets[0]

  tags = var.tags
}
