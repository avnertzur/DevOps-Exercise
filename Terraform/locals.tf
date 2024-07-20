locals {
  vpc_azs             = ["${var.aws_region}a"]
  keypair_export_path = "${path.root}/secret"
}