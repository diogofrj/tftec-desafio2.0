
resource "azurerm_resource_group" "rg" {
  name     = "RG-Desafio"
  location = "EastUS"
  tags     = var.tags
}