resource "proxmox_lxc" "<<Name of your resource>>" {
  target_node = "<< NAME OF YOUR PROXMOX NODE >>"
  hostname = "<< HOSTNAME OF YOUR CONTAINER >>"
  ostemplate = "<< LOCATION OF OS TEMPLATE >>"
  // Example : local:vztmpl/ubuntu-20.04-standard_20.04-1_amd64.tar.gz
  
  password = "<< PASSWORD OF YOUR CONTAINER >>"
  unprivileged = true

  rootfs {
      storage = "local-lvm"
      // For storage value it could be "local-zfs" or "local". Depends on your proxmox disk configuration
      
      size = "<< DISK SIZE FOR YOUR CONTAINER >>"
  }

  network {
      name = "<< NAME OF CONTAINER'S INTERFACES (e.g : eth0)>>"
      bridge = "vmbr0"
      ip = "<< IP ADDRESS FOR YOUR CONTAINER >>"
      gw = "<< GATEWAY >>"
      // If using dhcp, you can delete or disable gw (gateway) and fill out ip parameter with "dhcp"
  }
}