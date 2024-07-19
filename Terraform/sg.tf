resource "aws_security_group" "external_connection_sg" {
  name        = "external-connection-sg"
  description = "Allow SSH and HTTP traffic"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_security_group_rule" "SSH" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = var.private_ip
  description       = "SSH"
  security_group_id = aws_security_group.external_connection_sg.id
}

resource "aws_security_group_rule" "HTTPS" {
  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = var.private_ip
  description = "HTTPS"

  security_group_id = aws_security_group.external_connection_sg.id
}

resource "aws_security_group_rule" "PING" {
  type        = "ingress"
  from_port   = 8
  to_port     = 0
  protocol    = "icmp"
  cidr_blocks = var.private_ip
  description = "ping"

  security_group_id = aws_security_group.external_connection_sg.id
}