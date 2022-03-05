resource "azurerm_virtual_network" "vnetus1" {
  name                = var.network.vnetnameus1
  address_space       = var.network_prefix.vnetprefixus1
  location            = var.regionus1
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
  dns_servers         = ["10.1.0.4", "8.8.8.8"]
}
resource "azurerm_subnet" "subus1" {
  name                 = var.network.snetnameus1
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnetus1.name
  address_prefixes     = var.network_prefix.snetprefixus1
}

resource "azurerm_virtual_network" "vnetus2" {
  name                = var.network.vnetnameus2
  address_space       = var.network_prefix.vnetprefixus2
  location            = var.regionus2
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
  dns_servers         = ["10.1.0.4", "8.8.8.8"]
}
resource "azurerm_subnet" "subus2" {
  name                 = var.network.snetnameus2
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnetus2.name
  address_prefixes     = var.network_prefix.snetprefixus2
}