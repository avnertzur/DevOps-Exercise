# Ansible Configuration Manager

This Ansible project utilizes the `geerlingguy.docker` [role](https://galaxy.ansible.com/ui/standalone/roles/geerlingguy/docker/documentation/) to download Docker onto a selected host, create a new user and give it permissions to run Docker commands. 

## Prerequisites

1. Install Ansible


## Usage

1. Navigate to project directory.

2. Edit `hosts.yaml`, replace `<instance_ip>` with the IP of the instance that was outputed from the terraform.

3. Download required roles:
    ```bash
    ansible-galaxy install -r requirements.yml
    ```
4. Run the playbook with the following command:
    ```bash
    ansible-playbook -i hosts.yaml playbook.yaml   
    ```