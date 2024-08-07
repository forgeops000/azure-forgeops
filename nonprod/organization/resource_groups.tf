resource "azurerm_resource_group" "rg" {
  name     = "${var.environment}-${var.project}-rg"
  location = var.location
}