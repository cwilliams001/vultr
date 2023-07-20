# Specify the required provider and its version
terraform {
  required_providers {
    vultr = {
      source  = "vultr/vultr"
      version = "2.15.1"
    }
  }
}

# Configure the Vultr provider with the API key
provider "vultr" {
  api_key = var.vultr_api_key
}

# Define a Vultr instance
resource "vultr_instance" "test_bastion" {
  plan        = "vc2-1c-1gb"
  region      = "ewr"
  os_id       = "1743"
  label       = "test_bastion"
  ssh_key_ids = [var.ssh_key_id]


# Local provisioner to write the instance's IP to the inventory.ini fil
  provisioner "local-exec" {
    command = "printf '[bastion]\n${vultr_instance.test_bastion.main_ip}\n' >> ./playbooks/inventory.ini"
  }
}