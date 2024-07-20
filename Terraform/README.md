# Terraform Infrastructure as Code (IaC)

This Terraform project sets up an Amazon Web Services (AWS) environment with the following components:

1. **Virtual Private Cloud (VPC)**: A custom VPC with private and public subnets.
2. **Security Groups (SGs)**:
   - `external_connection_sg`: Allows inbound traffic on port 443 (HTTPS), port 22 (SSH) and ICMP (ping) from a private IP.
   - `internal_connection_sg`: Allows inbound traffic on port 22 (SSH) from the `external_connection_sg`.
3. **Key Pair**:
   - Generate Key Pair to enable SSH connection with instance
4. **EC2 Instance**:
   - Launches a t3.micro EC2 instance in the public subnet.
   - Associates the `external_connection_sg` with the instance.
   - Associates the generated Key Pair with the instance.

## Prerequisites

1. Install Terraform: [Terraform Installation Guide](https://learn.hashicorp.com/tutorials/terraform/install-cli)
2. Configure AWS credentials: Ensure your AWS access keys are set up.

## Variables

- `aws_region`: AWS Region to deploy the VPC in (default: `us-east-1`).
- `keypair_name`: Keypair name (default: `devops_kp`).
- `private_ip`: Personal IP to connect with.
- `tags`: Tags to add to all resources (default: `{ "Terraform": "true", "DevopsMaster": "true" }`).
- `vpc_name`: The Name of the VPC.
- `vpc_cidr`: CIDR block for VPC.
- `vpc_private_subnets`: List of private subnets to create in VPC.
- `vpc_public_subnets`: List of public subnets to create in VPC.

## Security Groups

### External Connection Security Group

- Name: `external-connection-sg`
- Description: Allows SSH, HTTPS, and ping traffic externally.
- Ingress rules:
  - SSH (port 22) from private IP.
  - HTTPS (port 443) from private IP.
  - ICMP (ping) from private IP.

### Internal Connection Security Group

- Name: `internal-connection-sg`
- Description: Allows SSH traffic internally.
- Ingress rule:
  - SSH (port 22) from the `external-connection-sg`.

## Usage

1. Clone this repository.
2. Navigate to the project directory.
3. Initialize Terraform:
   ```bash
   terraform init
   ```
4. Create `terraform.tfvars` file with required variables. For example:
   ```yaml
   private_ip = ["45.80.184.49/32"]
   vpc_cidr = "10.42.0.0/16"
   vpc_name = "Production"
   vpc_private_subnets = ["10.42.1.0/24"]
   vpc_public_subnets = ["10.42.2.0/24"]
   ```
5. Test the infrastructure:
   ```bash
   terraform plan
   ```
6. When previous step completes successfully, deploy the infrastructure:
   ```bash
   terraform apply
   ```
7. Destroy the infrastructure when done:
   ```bash
   terraform destroy
   ```

## Outputs

- `instance_ip`: public IP of EC2 instance

## Notes

- Replace the default values in `variables.tf` with your desired settings.
- Ensure AWS credentials configured (either via environment variables or AWS CLI).
