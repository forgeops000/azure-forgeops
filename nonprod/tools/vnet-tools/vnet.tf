# Create virtual network
resource "azurerm_virtual_network" "vnet-tools" {
  name                = "vnet-tools"
  address_space       = ["10.200.0.0/16"]
  location            = data.terraform_remote_state.organization.outputs.location
  resource_group_name = data.terraform_remote_state.organization.outputs.resource_group_name
  }

# Create subnet
resource "azurerm_subnet" "subnet-tools-1" {
  name                 = "subnet-tools-1"
  resource_group_name  = data.terraform_remote_state.organization.outputs.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet-tools.name
  address_prefixes     = ["10.200.1.0/24"]
}
