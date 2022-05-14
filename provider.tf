terraform {
  
  required_version = ">= 0.13.0"

  required_providers {
    proxmox = {
        source = "telmate/proxmox"
        version = "2.9.3"
    }
  }
}

variable "proxmox_api_url" {
  type = string
}

variable "proxmox_api_token_id" {
  type = string
  sensitive = true
}

variable "proxmox_api_token_secret" {
  type = string
  sensitive = true
}

provider "proxmox" {
  
  pm_api_url = var.proxmox_api_url
  pm_api_token_id = var.proxmox_api_token_id
  pm_api_token_secret = var.proxmox_api_token_secret

  pm_tls_insecure = true
  // If you're using a self-signed certificate and your client doesn't trust the connection to the proxmox
  // you can set pm_tls_insecure to "true"
  
  // But if your client trus your certificate, you can disable pm_tls_insecure parameter
}