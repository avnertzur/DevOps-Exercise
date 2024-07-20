# Ansible Playbook for Setting Up Docker with devops user permission on Ubuntu 22.04

This Ansible playbook automates the setup of Docker and a user named `devops` on an Ubuntu 22.04 server. The playbook performs the following tasks:

1. Updates the APT package index.
2. Installs Docker.
3. Creates a new user named `devops`.
4. Adds the `devops` user to the `docker` group.

## Requirements

- Ansible 2.9 or higher.
- SSH access to the target Ubuntu 22.04 server.
- Private key for SSH authentication (default: `~/.ssh/id_rsa`).

## Usage

1. **Save the Playbook**

   Save the provided playbook to a file named `playbook.yml`.

2. **Run the Playbook**

   Execute the following command to run the playbook:

   ```bash
   ansible-playbook -i <ec2_publicIP>, -u ubuntu --private-key <local_private_key_path> playbook.yml
