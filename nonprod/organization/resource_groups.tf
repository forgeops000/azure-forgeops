resource "azurerm_resource_group" "nonprod-rg" {
  name     = "${var.environment}-${var.project}-rg"
  location = var.location
}