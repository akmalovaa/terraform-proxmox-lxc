# main settings
target_node = "pve3"
lxc_vmid = 130
lxc_hostname = "terraformexp"
lxc_password = "12345"

# resources
lxc_cpu = 4
lxc_memory = 4096
storage = "local"
size = "15G"
# lxc_template = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"

# additionally
lxc_start = true
lxc_onboot = false
tags = "terraform"

ssh_public_keys = <<EOF
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOy/yHd40aw3xQ8sB+/0FKSc/9t4aLeh01cB7Q+mT6lX
EOF

description = <<EOF
<div align='center'>
    <a href='https://github.com/akmalovaa/terraform-proxmox-lxc'>
        <img src='https://raw.githubusercontent.com/hashicorp/vscode-terraform/main/assets/icons/terraform.svg'/>
    </a>

# LXC Ubuntu 24.04
Сreated by terraform
EOF
