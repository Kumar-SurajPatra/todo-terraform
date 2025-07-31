module "resource_group" {
  source                  = "../modules/azurerm_resource_group"
  resource_group_name     = "rg-todoapp"
  resource_group_location = "centralindia"
}

module "resource_group2" {
  source                  = "../modules/azurerm_resource_group"
  resource_group_name     = "rg-todoapp2"
  resource_group_location = "centralindia"
}

module "vitual_network" {
  depends_on         = [module.resource_group]
  source             = "../modules/azurerm_virtual_network"
  vNet_name          = "vnet-todoapp"
  vNet_rg_name       = "rg-todoapp"
  vNet_location      = "centralindia"
  vNet_address_space = ["10.0.0.0/16"]
}

module "frontend_subnet" {
  depends_on              = [module.vitual_network]
  source                  = "../modules/azurerm_subnet"
  subNet_name             = "frontend-subnet"
  subNet_rg_name          = "rg-todoapp"
  subNet_vNet_name        = "vnet-todoapp"
  subNet_address_prefixes = ["10.0.1.0/24"]
}

module "backend_subnet" {
  depends_on              = [module.vitual_network]
  source                  = "../modules/azurerm_subnet"
  subNet_name             = "backend-subnet"
  subNet_rg_name          = "rg-todoapp"
  subNet_vNet_name        = "vnet-todoapp"
  subNet_address_prefixes = ["10.0.2.0/24"]
}

module "frontend_public_ip" {
  depends_on          = [module.resource_group]
  source              = "../modules/azurerm_public_ip"
  public_ip_name      = "frontend-pip"
  public_ip_location  = "centralindia"
  resource_group_name = "rg-todoapp"
  allocation_method   = "Static"
}

module "backend_public_ip" {
  depends_on          = [module.resource_group]
  source              = "../modules/azurerm_public_ip"
  public_ip_name      = "backend-pip"
  public_ip_location  = "centralindia"
  resource_group_name = "rg-todoapp"
  allocation_method   = "Static"
}

module "sql_server"{
  depends_on          = [module.resource_group]
  source = "../modules/azurerm_sql_server"
  sql_server_name = "sql-server-todoapp"
  resource_group_name = "rg-todoapp"
  location = "centralindia"
  administrator_login = "sqladmin"
  administrator_login_password = "Password@123"  
}

module "sql_database"{
  depends_on = [ module.sql_server ]
  source = "../modules/azurerm_sql_database"
  sql_database_name = "todoDB"
  sql_server_name = "sql-server-todoapp"
  rg_name = "rg-todoapp"
}

module "backend_vm" {
  source = "../modules/azurerm_virtual_machine"
  depends_on = [ module.backend_subnet, module.backend_public_ip ]
  nic_name = "backend_vm_nic"
  location = "centralindia"
  rg_name = "rg-todoapp"
  vnet_name = "vnet-todoapp"
  subnet_name = "backend-subnet"
  vm_name = "backend-vm"
  vm_username = "backend-todo-vm"
  vm_password = "Qwert@123"
  pip_name = "backend-pip"
  
}

module "frontend_vm" {
  source = "../modules/azurerm_virtual_machine"
  depends_on = [ module.frontend_subnet, module.frontend_public_ip ]
  nic_name = "frontend_vm_nic"
  location = "centralindia"
  rg_name = "rg-todoapp"
  vnet_name = "vnet-todoapp"
  subnet_name = "frontend-subnet"
  vm_name = "frontend-vm"
  vm_username = "frontend-todo-vm"
  vm_password = "Poiuy@098"
  pip_name = "frontend-pip"
  
}