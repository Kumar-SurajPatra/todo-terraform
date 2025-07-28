resource azurerm_virtual_network vNet {
    name = var.vNet_name
    resource_group_name = var.vNet_rg_name
    location = var.vNet_location
    address_space = var.vNet_address_space
}