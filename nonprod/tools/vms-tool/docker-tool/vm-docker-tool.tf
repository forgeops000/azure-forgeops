locals {
    instance-name = "${local.environment}-${local.project}-${local.app}"
}

# Create public IPs
resource "azurerm_public_ip" "docker_tool_public_ip" {
  name                = "${local.instance-name}-PublicIP"
  location            = local.location
  resource_group_name = local.resource_group_name
  allocation_method   = "Dynamic"
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "docker_tool_nsg" {
  name                = "${local.instance-name}-nsg"
  location            = local.location
  resource_group_name = local.resource_group_name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Create network interface
resource "azurerm_network_interface" "docker_tool_nic" {
  name                = "${local.instance-name}-nic"
  location            = local.location
  resource_group_name = local.resource_group_name

  ip_configuration {
    name                          = "${local.instance-name}-nic-conf"
    subnet_id                     = data.terraform_remote_state.vnet-tools.outputs.vnet-subnet-1
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.docker_tool_public_ip.id
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "docker_tool_nic_nsg_association" {
  network_interface_id      = azurerm_network_interface.docker_tool_nic.id
  network_security_group_id = azurerm_network_security_group.docker_tool_nsg.id
}

# Generate random text for a unique storage account name
resource "random_id" "random_id" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group_name      = local.resource_group_name
  }

  byte_length = 8
}

# Create storage account for boot diagnostics
resource "azurerm_storage_account" "docker_tool_account" {
  name                     = "diag${random_id.random_id.hex}"
  location                 = local.location
  resource_group_name      = local.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "docker_tool_vm" {
  name                  = local.instance-name
  location              = local.location
  resource_group_name   = local.resource_group_name
  network_interface_ids = [azurerm_network_interface.docker_tool_nic.id]
  size                  = "Standard_B1s"

  os_disk {
    name                 = "${local.instance-name}-OsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  computer_name  = "hostname"
  admin_username = local.default_username

  admin_ssh_key {
    username   = local.default_username
    public_key = local.ssh_publicKey
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.docker_tool_account.primary_blob_endpoint
  }
}