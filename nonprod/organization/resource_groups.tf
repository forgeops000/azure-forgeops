resource "azurerm_resource_group" "nonprod" {
  name     = var.environment
  location = var.location
}