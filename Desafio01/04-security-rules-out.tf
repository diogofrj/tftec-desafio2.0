locals {
  nsgrulesout = {
    #   Template = {
    #       name                         = "Template"
    #       priority                     = 100
    #       direction                    = "Outbound"
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
    # SSH-IN = {
    #     name                         = "SSH-IN"
    #     priority                     = 100
    #     direction                    = "Outbound"
    #     access                       = "Allow"
    #     protocol                     = "Tcp"
    #     source_address_prefix        = "${chomp(data.http.clientip.body)}/32"
    #     source_address_prefixes      = []
    #     destination_address_prefix   = "*"
    #     destination_address_prefixes = []
    #     source_port_range            = "*"
    #     source_port_ranges           = []
    #     destination_port_range       = "22"
    #     destination_port_ranges      = []
    #     description                  = "Permite SSH"
    #   }
  }
}