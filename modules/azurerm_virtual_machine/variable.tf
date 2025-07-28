variable nic_name{
    type = string
    description = "name of nic"
}

variable location {
    type = string
    description = "location of nic"
}

variable rg_name{
    type = string
    description = "name of resource group"
}

variable vm_name{
    type = string
    description = "name of vm"
}

variable "vm_username" {
  type = string
  description = "username of vm"
}

variable "vm_password" {
  type = string
  description = "password of vm"
}

variable "subnet_name" {
  type = string
  description = "name of subnet"
}

variable vnet_name {
    type = string
    description = "name of vnet"
}

variable pip_name{
    type = string
    description = "name of public ip"
    nullable = true
    default = null
}

variable "existing_key_vault_name" {
  type = string
  description = "name of key vault which is already created in azure"  
}