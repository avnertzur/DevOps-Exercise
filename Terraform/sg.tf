resource "aws_security_group" "external_connection_sg" {
  name        = "external-connection-sg"
  description = "Allow SSH, HTTPS and ping traffic externally"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_security_group_rule" "External_SSH" {
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

resource "aws_security_group_rule" "ping" {
  type        = "ingress"
  from_port   = 8
  to_port     = 0
  protocol    = "icmp"
  cidr_blocks = var.private_ip
  description = "ping"

  security_group_id = aws_security_group.external_connection_sg.id
}

resource "aws_security_group_rule" "internet" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  description = "access out"

  security_group_id = aws_security_group.external_connection_sg.id
}

resource "aws_security_group" "internal_connection_sg" {
  name        = "internal-connection-sg"
  description = "Allow SSH traffic internally"
  vpc_id      = module.vpc.vpc_id
}

resource "aws_security_group_rule" "Internal_ingress_SSH" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  self              = true
  description       = "SSH"
  security_group_id = aws_security_group.internal_connection_sg.id
}

resource "aws_security_group_rule" "Internal_egress_SSH" {
  type              = "egress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  self              = true
  description       = "SSH"
  security_group_id = aws_security_group.internal_connection_sg.id
}
