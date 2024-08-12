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
      key                  = "nonprod/tools/vms-tool/docker-tool/terraform.tfstate"
  }

}

provider "azurerm" {
  features {}
}

data "terraform_remote_state" "organization" {
  backend = "azurerm"
  config = {
    resource_group_name   = "tfstate"
    storage_account_name  = "tfstatexmbi4"
    container_name        = "tfstate"
    key                   = "nonprod/organzation/terraform.tfstate"
  }
}
  data "terraform_remote_state" "vnet-tools" {
  backend = "azurerm"
  config = {
    resource_group_name   = "tfstate"
    storage_account_name  = "tfstatexmbi4"
    container_name        = "tfstate"
    key                   = "nonprod/tools/vnet/terraform.tfstate"
  }
}