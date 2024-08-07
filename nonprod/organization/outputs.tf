output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "location" {
  value = var.location
}

output "environment" {
  value = var.environment
}

output "project" {
  value = var.project
}

output "ssh-key" {
  value = azurerm_ssh_public_key.ssh-key.public_key
}

output "default_username" {
  value = var.default_username
}
