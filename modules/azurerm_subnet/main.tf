resource azurerm_subnet subNet-demo{
    name = var.subNet_name
    resource_group_name = var.subNet_rg_name
    virtual_network_name = var.subNet_vNet_name
    address_prefixes = var.subNet_address_prefixes
}