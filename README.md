# WireGuard VPN Automation with Terraform and Ansible

This project automates the deployment of a WireGuard VPN server on Vultr using Terraform and Ansible. WireGuard is a simple, fast, and modern VPN that utilizes state-of-the-art cryptography. It aims to be faster, simpler, leaner, and more useful than IPsec.

## Prerequisites

You should have the following installed on your local machine:

- [Terraform](https://www.terraform.io/downloads.html)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

You should also have a Vultr API Key and an SSH Key ID on your Vultr account.

To obtain ssh_key_id, run:
```
curl -H 'Authorization: Bearer Vultr_API_KEY' https://api.vultr.com/v2/ssh-keys
```

## Quick Start

1. Clone this repository and navigate to the project directory.

2. Replace `VULTR_API_KEY` and `YOUR SSH_KEY_ID` in the `terraform.tfvars` file with your Vultr API Key and SSH Key ID, respectively.

3. Initialize Terraform:

   ```
   terraform init
   ```

4. Apply the Terraform configuration:

   ```
   terraform apply
   ```

   After the `apply` command completes, the IP address of the newly created Vultr instance will be added automatically to the `inventory.ini` file.

5. Run the Ansible playbook:

   ```
   ansible-playbook -i playbooks/inventory.ini playbooks/dwg.yml -u root
   ```

   This will setup the WireGuard VPN server on the Vultr instance and fetch the peer configuration files and QR code images to your local machine by default they will be placed onto your Desktop in /config and /qrcodes. This can be changed by editing the `playbooks/vars/main.yml` file.

6. Connect to the VPN server using the downloaded configuration files or QR code images.
