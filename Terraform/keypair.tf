resource "tls_private_key" "keypair_prv_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.keypair_name
  public_key = tls_private_key.keypair_prv_key.public_key_openssh
}

resource "local_file" "pk_file" {
  content         = tls_private_key.keypair_prv_key.private_key_pem
  filename        = "${local.keypair_export_path}/${var.keypair_name}.pem"
  file_permission = "0400"
}
