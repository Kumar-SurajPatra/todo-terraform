resource "azurerm_public_ip" "pip" {
  name                    = var.public_ip_name
  location                = var.public_ip_location
  resource_group_name     = var.resource_group_name
  allocation_method       = var.allocation_method
  idle_timeout_in_minutes = 30

  tags = {
    environment = "test"
  }
}