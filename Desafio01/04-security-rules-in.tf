locals {
  nsgrulesin = {
    #   Template = {
    #       name                         = "Template"
    #       priority                     = 100
    #       direction                    = "Inbound"
    #       access                       = "Allow"
    #       protocol                     = "Tcp"
    #       source_address_prefix        = "Internet"
    #       source_address_prefixes      = []
    #       destination_address_prefix   = "*"
    #       destination_address_prefixes = []
    #       source_port_range            = "*"
    #       source_port_ranges           = []
    #       destination_port_range       = "443"
    #       destination_port_ranges      = []
    #       description                  = "Bastion Allow HTTPS Inbound: https://docs.microsoft.com/en-us/azure/bastion/bastion-nsg#apply"
    #     }
    ACCESS-IN = {
      name                         = "ACCESS-IN"
      priority                     = 100
      direction                    = "Inbound"
      access                       = "Allow"
      protocol                     = "Tcp"
      source_address_prefix        = "${chomp(data.http.clientip.body)}/32"
      source_address_prefixes      = []
      destination_address_prefix   = "*"
      destination_address_prefixes = []
      source_port_range            = "*"
      source_port_ranges           = []
      destination_port_range       = ""
      destination_port_ranges      = ["22", "3389"]
      description                  = "Permite SSH e RDP from PC"
    }
  }
}