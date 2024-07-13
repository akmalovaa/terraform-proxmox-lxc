# Docs: https://registry.terraform.io/providers/Telmate/proxmox/latest/docs/resources/lxc

variable "lxc_hostname" {
  description = "LXC container hostname"
  type        = string
  default     = "autoterraform"
}

variable "lxc_vmid" { 
  description = "LXC container ID"
  type        = number
  default     = 100
  validation {
    condition     = var.lxc_vmid >= 100 && var.lxc_vmid <= 255
    error_message = "VMID used as the lxc ip address, must be between 100 and 255"
  }
}

variable "lxc_password" {
  description = "Sets the root password inside the container"
  type        = string
  default     = "pve"
}

variable "target_node" {
  description = "Target ProxMox node to host"
  type        = string
  default     = "pve"
}

variable "lxc_template" { 
  description = "lxc os template"
  default     = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
  type        = string 
}

variable "lxc_cpu" {
  description = "Number of CPU cores"
  type        = number
  default     = 2
}

variable "lxc_memory" {
  description = "Memory RAM"
  type        = number
  default     = 2000
}

variable "lxc_swap" {
  description = "A number that sets the amount of swap memory available to the container"
  type        = number
  default     = 512
}

variable "storage" {
  description = "Storage of the VM."
  type        = string
  default     = "local"
}

variable "size" {
  description = "Storage size (e.g. 1T, 1G, 1024M , 1048576K) is a read only value"
  type = string
  default = "10G"
}

variable "ip_address" {
  description = "Can be a static IPv4 address CIDR notation, dhcp, or manual"
  type        = string
  default = "192.168.0.100/24"
}

variable "gateway" {
  description = "Gateway of the VM"
  type        = string
  default = "192.168.0.1"
}


variable "nameserver" {
  description = "Nameserver of the VM"
  type        = string
  default = ""
}

variable "searchdomain" {
  description = "Search domain of the VM"
  type        = string
  default     = "akmalov.com"
}

variable "ssh_public_keys" {
  description = "SSH public keys to add to the VM"
  type        = string
  default     = ""
}

variable "unprivileged" { 
  description = "A boolean that makes the container run as an unprivileged user"
  type        = bool
  default     = true
}

variable "lxc_start" {
  description = "A boolean that determines if the container is started after creation"
  type        = bool
  default     = false
}

variable "lxc_onboot" {
  description = "A boolean that determines if the container will start on boot"
  type        = bool
  default     = false
}

variable "lxc_force" {
  description = "A boolean that allows the overwriting of pre-existing containers"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags of the container, semicolon-delimited (e.g. 'terraform;test'), this is only meta information"
  type        = string
  default     = "terraform"
}

variable "description" {
  description = "Sets the container description seen in the web interface"
  type        = string
  default     = "LXC was created using terraform"
}
