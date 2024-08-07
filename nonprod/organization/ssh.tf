resource "azurerm_ssh_public_key" "nonprod-forgeops-ssh" {
  name                = "${var.environment}-${var.project}"
  resource_group_name = azurerm_resource_group.nonprod-rg.name
  location            = var.location
  public_key          = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC2cTYcgjMo6F+NCloHp+EmzvLgHYDwe8ETIzoh9/O5+EEFO3TkvOUCKieq7C8suS9CM3Sd/2EoooXCHvcNdvmYcF8OB7m31+EOeqwKy6PiHmu3ivMHk9zxLU8Tr2rAdQPmzMCe6Oi6Uit857ODiKf4Xrc5GLF0xGiDMHF4+xSgVecnYTBWHF39pLZ2fYx0dxAVRVMaJnFaif8/GH2iKNZ8VU2W8TI86CprYf1W6PuUjlaSh5nAn8PyRLtEoR9Kj0DF0VjwNPhqhk8rq+uC4ZPQqLgRX5Y+wDhCMis9W47LBp66Yws1f6gy23bDRg6vaoia3F8rJFXTrEZPrpAror1NT3hkq9kpT5kejL3DWRtijtPr5ihH1qGz2+fL61AJyD4eyKcUbCLxIrQkkLW+X9r6aDvCwzvDyogAly75icip5+mBz2TQTLbJYxnc4XgviShF8L4IVBa3kMeoUk/Oq5jKXszp+xyskF/o4UUiIyiwpXMMR//jIvMIvyLm9Pk3jeMvcA1+d8eAwVevv8cqhBzVE5K3AM5m5PVyL/zdqbOEzRb+OFD5iS0WvnzSjwKR6T5PGmqJDi2ycvzsaKbvs+iZLb30NFQvDsyrjvqlf2dJhqbyw0MM83XEUPCPqaHGqZfioS2jOdEPqQWPK5gejpZV9bjDz4o2LVSZrf0t6WYHCw== nonprod@forgeops"
}