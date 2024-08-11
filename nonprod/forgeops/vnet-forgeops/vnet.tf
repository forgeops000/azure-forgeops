# Create virtual network
resource "azurerm_virtual_network" "vnet-forgeops" {
  name                = "vnet-forgeops"
  address_space       = ["10.0.0.0/16"]
  location            = data.terraform_remote_state.organization.outputs.location
  resource_group_name = data.terraform_remote_state.organization.outputs.resource_group_name
  }

# Create subnet
resource "azurerm_subnet" "subnet-forgeops-1" {
  name                 = "subnet-forgeops-1"
  resource_group_name  = data.terraform_remote_state.organization.outputs.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet-forgeops.name
  address_prefixes     = ["10.0.1.0/24"]
}
