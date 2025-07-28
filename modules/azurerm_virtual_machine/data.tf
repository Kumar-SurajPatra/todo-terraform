data "azurerm_subnet" "existing"{
  name = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name = var.rg_name
}

data "azurerm_public_ip" "public_ip" {
  name                = var.pip_name
  resource_group_name = var.rg_name
}

data "azurerm_key_vault" "kv" {
  name                = var.existing_key_vault_name
  resource_group_name = var.rg_name
}

data "azurerm_key_vault_secret" "secret" {
  name         = "vm-password"
  key_vault_id = data.azurerm_key_vault.kv.id
}
