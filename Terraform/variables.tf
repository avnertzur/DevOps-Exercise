# Define variable for public key path
variable "public_key_path" {
  description = "Enter full path to your public key , press Enter to use default common path ( ~/.ssh/id_rsa.pub)"
  type        = string
}

# Define a local value to determine the effective public key path
locals {
  effective_public_key_path = var.public_key_path != "" ? var.public_key_path : "~/.ssh/id_rsa.pub"
}

# Define variable for public IP address
variable "user_public_ip" {
  description = "Enter your public IP address"
  type        = string

  validation {
    condition = length(trimspace(var.user_public_ip)) > 0
    error_message = "Public IP address must not be empty."
  }
}