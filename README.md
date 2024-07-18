# DevOps-Exercise
DevOps home task

## Prerequisites

Ensure you have the following tools installed and configured:
- Terraform
- AWS CLI
- Ansible or you can use `cytopia/ansible:latest-infra` which include everything we need and make scripts run faster and smoother 

## Task 1 - Terrafom:
Write a Terraform script the spins up and EC2 in a new VPC.
- VPC CIDR 10.42.0.0/16
- Internet GW 
- Two subnets in the VPC:
  - internal subnet 10.42.1.0/24
  - external subnet 10.42.2.0/24
- Add Security Group that allowd SSH, PING and HTTPS to the external subnet from your IP (so you can test it)
- Add Security Group that allowd SSH between the external and internal subnet
- Spin a small EC2 in the external subnet & attach the external SG to it (use a standard AWS AMI) and assosiate a public IP to it

## Task 2 - Ansible:
Write an Ansible playbook that runs on an Ubuntu 22.04:
- installs docker
- creates new user called "devops"
- allows the "devops" user to run docker commands

Feel free to add expanations and "how-to" in the ReadMe files 

# Good Luck !