terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  backend "azurerm" {
      resource_group_name  = "tfstate"
      storage_account_name = "tfstatexmbi4"
      container_name       = "tfstate"
      key                  = "nonprod/tools/vms-tool/terraform.tfstate"
  }

}

provider "azurerm" {
  features {}
}

# resource "azurerm_resource_group" "nonprod" {
#   name     = "nonprod"
#   location = "polandcentral"
# }