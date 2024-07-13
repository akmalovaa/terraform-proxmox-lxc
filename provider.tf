terraform {
  required_version = ">= 1.1.0"

  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "3.0.1-rc1"
    }
  }
}

variable "proxmox_api_url" {
  type    = string
  default = "https://10.0.0.2:8006/api2/json"
}

variable "pm_user" {
  sensitive = true
  default   = "terraform-prov@pve"
}

variable "pm_password" {
  type      = string
  sensitive = true
}

provider "proxmox" {
  pm_api_url      = var.proxmox_api_url
  pm_user         = var.pm_user
  pm_password     = var.pm_password
  pm_tls_insecure = true

  # pm_log_enable = true
  # pm_log_file   = "terraform-plugin-proxmox.log"
  # pm_debug      = true
  # pm_log_levels = {
  #   _default    = "debug"
  #   _capturelog = ""
  # }
}