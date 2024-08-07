output "resource_group_name" {
  value = azurerm_resource_group.nonprod.name
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

output "nonprod-forgeops" {
  value = azurerm_ssh_public_key.nonprod-forgeops.public_key
}

