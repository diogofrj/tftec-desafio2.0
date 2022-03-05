# resource "azurerm_image" "VM-DC" {
#   name                = "IMG-VM-DC"
#   location            = var.regionus2
#   resource_group_name = azurerm_resource_group.rg.name
#   hyper_v_generation = "V2"
#   tags = var.tags

#   os_disk {
#     os_type  = "Windows"
#     os_state = "Generalized"
#     blob_uri = "${azurerm_storage_container.saus2.id}/vm-dc.vhd"
#     size_gb  = 128
#     caching = "ReadWrite"
#   }
# }