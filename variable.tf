variable "resource_group_name" {
  default = "terraform-rg"
}

variable "location" {
  default = "Central India"
}

variable "vnet_name" {
  default = "terraform-vnet"
}

variable "subnet_name" {
  default = "terraform-subnet"
}

variable "nsg_name" {
  default = "terraform-nsg"
}

variable "nic_name" {
  default = "terraform-nic"
}

variable "vm_name" {
  default = "terraform-linux-vm"
}

variable "admin_username" {
  default = "azureuser"
}