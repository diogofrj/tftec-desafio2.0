variable "tokendevops" {}
variable "url_org" {}
variable "rgname" {}
variable "signame" {}
variable "regionus1" {}
variable "regionus2" {}

variable "countador" {
  description = "Numero de Instancias"
}

variable "nsgname" {}

variable "tags" {
  description = "Tags do projeto"
  type        = map(string)
}

variable "network" {
  type = map(string)
}
variable "network_prefix" {
  type = any
}
# vnetnameus1   = string
# vnetprefixus1 = list(any)
# snetnameus1   = string
# snetprefixus1 = list(any)
# vnetnameus2   = string
# vnetprefixus2 = list(any)
# snetnameus2   = string
# snetprefixus2 = list(any)
# variable "rules" {
#   description = "name, priority, direction, access, protocol, source_port_range, destination_port_range, source_address_prefix, destination_address_prefix, network_security_group_name"
#   type        = map(object({
#     name                         = string
#     priority                     = string
#     direction                    = string
#     access                       = string
#     protocol                     = string

#     source_port_range            = string
#     source_port_ranges           = list(any)

#     destination_port_range       = string
#     destination_port_ranges      = list(any)

#     source_address_prefix      = string
#     source_address_prefixes      = list(any)

#     destination_address_prefix   = string
#     destination_address_prefixes = list(any)
#   }))
# }