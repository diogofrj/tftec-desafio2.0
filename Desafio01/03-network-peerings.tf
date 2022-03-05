

resource "azurerm_virtual_network_peering" "us1" {
  name                         = "peering-eastus-to-centralus"
  resource_group_name          = azurerm_resource_group.rg.name
  virtual_network_name         = azurerm_virtual_network.vnetus1.name
  remote_virtual_network_id    = azurerm_virtual_network.vnetus2.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "us2" {
  name                         = "peering-centralus-to-eastus"
  resource_group_name          = azurerm_virtual_network.vnetus2.resource_group_name
  virtual_network_name         = azurerm_virtual_network.vnetus2.name
  remote_virtual_network_id    = azurerm_virtual_network.vnetus1.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

