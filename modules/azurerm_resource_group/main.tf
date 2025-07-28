resource "azurerm_resource_group" "res-grp" {
  name = var.resource_group_name
  location = var.resource_group_location
}