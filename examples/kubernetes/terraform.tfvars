# Example building a Kubernetes cluster consisting of 3 virtual machines (1 control plane and 2 worker nodes).
vsphere_user       = "kovtunav"
vsphere_password   = "nwBJSuVH8Hl2zuW"
vsphere_server     = "vcsa01.lab.local"
vsphere_datacenter = "LAB"
vsphere_cluster    = "CL"
vsphere_datastore  = "DS2"
vsphere_network    = "pg-VLAN604-usr"

# Global template to apply to all virtual machines
vm_template_name    = "ubuntu-jammy-22.04-cloudimg"
vm_user             = "appuser"
vm_group            = "appowner"
vm_timezone         = "America/Los_Angeles"
vm_disk_size        = 20
ssh_authorized_keys = ["my_ssh_authorized_key"]
userdata_file       = "examples/kubernetes/userdata.tftpl"

virtual_machines = [
  {
    fqdn        = "c1-cp1.lab.local",
    cpu         = 2,
    memory      = 4096,
    ip          = "10.200.4.71/24",
    gateway     = "10.200.4.1",
    nameservers = ["10.200.3.11", "10.200.3.12"]
  },
  {
    fqdn        = "c1-node1.lab.local",
    cpu         = 2,
    memory      = 4096,
    ip          = "10.200.4.72/24",
    gateway     = "10.200.4.1",
    nameservers = ["10.200.3.11", "10.200.3.12"]
  },
  {
    fqdn        = "c1-node2.lab.local",
    cpu         = 2,
    memory      = 4096,
    ip          = "10.200.4.73/24",
    gateway     = "10.200.4.1",
    nameservers = ["10.200.3.11", "10.200.3.12"]
  }
]

addl_disks = [
  {
    label            = "disk1",
    size             = 10,
    eagerly_scrub    = false,
    thin_provisioned = false,
    unit_number      = 1
  }
]
