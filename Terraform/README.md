# DevOps-Exercise Task 1 - Terraform:

This Terraform project sets up a VPC in AWS with an Internet Gateway, two subnets (internal and external), security groups, and an EC2 instance. The EC2 instance is configured to use an SSH key pair and allows specific inbound traffic.

## Table of Contents

1. [Files Overview](#files-overview)
2. [Prerequisites](#prerequisites)
3. [Usage](#usage)
4. [Outputs](#outputs)
5. [Variables](#variables)

## Files Overview

### network.tf

This file contains the configuration for:

- **VPC**: Creates a VPC with CIDR block `10.42.0.0/16`.
- **Internet Gateway**: Attaches an Internet Gateway to the VPC.
- **Subnets**: Creates two subnets (internal and external) within the VPC.
- **Route Tables**: Associates route tables with the internal and external subnets.

### instance.tf

This file contains the configuration for:

- **EC2 Instance**: Launches an EC2 instance in the external subnet, associates it with a security group, and sets up SSH access using a provided public key.

### sg.tf

This file contains the configuration for:

- **Security Groups**: Creates security groups for the internal and external subnets, allowing specific inbound and outbound traffic.

### variables.tf

This file defines variables used throughout the project:

- **public_key_path**: Path to the SSH public key.
- **user_public_ip**: Public IP address of the user.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed.
- AWS account with appropriate permissions to create VPCs, subnets, security groups, and EC2 instances.
- SSH public key available locally.

## Usage

1. **Clone the repository:**

    ```sh
    git clone <repository_url>
    cd <repository_directory>
    ```

2. **Initialize Terraform:**

    ```sh
    terraform init
    ```

3. **Configure Variables:**

   You will be prompted to enter the path to your SSH public key and your public IP address. Alternatively, you can create a `terraform.tfvars` file with the following content:

    ```hcl
    public_key_path = "/path/to/your/public/key"
    user_public_ip = "your_public_ip"
    ```

4. **Apply the configuration:**

    ```sh
    terraform apply
    ```

   Confirm the apply step with `yes` when prompted.

5. **Destroy the resources:**

   If you want to destroy the resources created by Terraform:

    ```sh
    terraform destroy
    ```

   Confirm the destroy step with `yes` when prompted.

## Outputs

- **instance_public_ip**: The public IP address of the EC2 instance.

## Variables

- **public_key_path**: Enter full path to your public key. Defaults to `~/.ssh/id_rsa.pub` if left empty.
- **user_public_ip**: Enter your home public IP address. Must not be empty.

### Example `terraform.tfvars` File

```hcl
public_key_path = "~/.ssh/id_rsa.pub"
user_public_ip = "89.138.152.84"
