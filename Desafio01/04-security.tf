#Create NSG for dc01
resource "azurerm_network_security_group" "nsg" {
  name                = var.nsgname
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  #   security_rule {
  #     name                       = "SSH-In"
  #     priority                   = 100
  #     direction                  = "Inbound"
  #     access                     = "Allow"
  #     protocol                   = "*"
  #     source_port_range          = "*"
  #     destination_port_range     = "22"
  #     source_address_prefix      = "${chomp(data.http.clientip.body)}/32"
  #     destination_address_prefix = "*"
  #   }
  tags = var.tags
}


resource "azurerm_network_security_rule" "rulesin" {
  for_each  = local.nsgrulesin // map of objects
  name      = each.value.name
  priority  = each.value.priority
  direction = each.value.direction
  access    = each.value.access
  protocol  = each.value.protocol

  source_address_prefix   = each.value.source_address_prefix != "" ? each.value.source_address_prefix : null
  source_address_prefixes = length(each.value.source_address_prefixes) > 0 ? each.value.source_address_prefixes : null

  destination_address_prefix   = each.value.destination_address_prefix != "" ? each.value.destination_address_prefix : null
  destination_address_prefixes = length(each.value.destination_address_prefixes) > 0 ? each.value.destination_address_prefixes : null

  source_port_range  = each.value.source_port_range != "" ? each.value.source_port_range : null
  source_port_ranges = length(each.value.source_port_ranges) > 0 ? each.value.source_port_ranges : null

  destination_port_range  = each.value.destination_port_range != "" ? each.value.destination_port_range : null
  destination_port_ranges = length(each.value.destination_port_ranges) > 0 ? each.value.destination_port_ranges : null

  resource_group_name         = var.rgname
  network_security_group_name = var.nsgname
  description                 = each.value.description
}

# resource "azurerm_network_security_rule" "rulesout" {
#     for_each = local.nsgrulesout  // map of objects
#         name                       = each.value.name
#         priority                   = each.value.priority
#         direction                  = each.value.direction
#         access                     = each.value.access
#         protocol                   = each.value.protocol

#         source_address_prefix        = each.value.source_address_prefix != "" ? each.value.source_address_prefix : null
#         source_address_prefixes      = length(each.value.source_address_prefixes) > 0 ? each.value.source_address_prefixes : null

#         destination_address_prefix   = each.value.destination_address_prefix != "" ? each.value.destination_address_prefix : null
#         destination_address_prefixes = length(each.value.destination_address_prefixes) > 0 ? each.value.destination_address_prefixes : null

#         source_port_range            = each.value.source_port_range != "" ? each.value.source_port_range : null
#         source_port_ranges           = length(each.value.source_port_ranges) > 0 ? each.value.source_port_ranges : null

#         destination_port_range       = each.value.destination_port_range != "" ? each.value.destination_port_range : null
#         destination_port_ranges      = length(each.value.destination_port_ranges) > 0 ? each.value.destination_port_ranges : null

#         resource_group_name          = var.rgname
#         network_security_group_name  = var.nsgname
#         description                  = each.value.description
# }

resource "azurerm_subnet_network_security_group_association" "this" {
  subnet_id                 = azurerm_subnet.subus1.id
  network_security_group_id = azurerm_network_security_group.nsg.id
  depends_on = [
    azurerm_subnet.subus1
  ]
}

