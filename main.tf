locals {
  ip_address = "10.0.0.${var.lxc_vmid}/24"
  gateway = "10.0.0.1"
  interface = "eth0"
  bridge = "vmbr0"
  # nameserver = ""
  # searchdomain = ""
  datetime   = formatdate("YYYY-MM-DD.hh-mm-ss", timestamp())
}

resource "proxmox_lxc" "lxc_container" {
  // main
  hostname     = var.lxc_hostname 
  vmid         = var.lxc_vmid
  target_node  = var.target_node
  password     = var.lxc_password

  // resources
  ostemplate   = var.lxc_template
  cores        = var.lxc_cpu
  memory       = var.lxc_memory
  swap         = var.lxc_swap
  
  // additionally
  onboot          = var.lxc_onboot
  tags            = var.tags
  unprivileged    = var.unprivileged
  ssh_public_keys = var.ssh_public_keys
  start           = var.lxc_start
  force           = var.lxc_force
  description     = var.description

  features {
    nesting = true
  }

  rootfs {
    storage = var.storage
    size    = var.size
  }
  
  network {
    name   = local.interface
    bridge = local.bridge
    ip     = local.ip_address
    gw     = local.gateway
  }
}
