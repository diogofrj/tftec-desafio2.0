# #https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/shared_image


# resource "azurerm_shared_image_gallery" "sig" {
#   name                = var.signame
#   resource_group_name = azurerm_resource_group.rg.name
#   location            = var.regionus2
#   description         = "Shared images"
#   tags                = var.tags
# }

# resource "azurerm_shared_image" "sig_vmdc" {
#   name                = "VM-DC"
#   gallery_name        = azurerm_shared_image_gallery.sig.name
#   resource_group_name = azurerm_resource_group.rg.name
#   location            = var.regionus2
#   os_type             = "Windows"
#   specialized = true
#   hyper_v_generation = "V2"
#   tags = var.tags

#   identifier {
#     publisher = "VM-DC"
#     offer     = "Windows-2022"
#     sku       = "VM-DC"
#   }
# }

# /*
# data "azurerm_image" "existing" {
#   name                = "search-api"
#   resource_group_name = "packerimages"
# }

# data "azurerm_shared_image" "existing" {
#   name                = "existing-image"
#   gallery_name        = "existing_gallery"
#   resource_group_name = "existing-resources"
# }
# */
# resource "azurerm_shared_image_version" "imagever_vmdc" {
#   name                = "1.0.0"
#   gallery_name        = azurerm_shared_image.sig_vmdc.gallery_name
#   image_name          = azurerm_shared_image.sig_vmdc.name
#   resource_group_name = azurerm_shared_image.sig_vmdc.resource_group_name
#   location            = azurerm_shared_image.sig_vmdc.location
# #   os_disk_snapshot_id = "${azurerm_storage_container.saus2.id}/vm-dc.vhd"
# os_disk_snapshot_id = azurerm_managed_disk.VM-DC.id
#   tags = var.tags

#   target_region {
#     name                   = var.regionus2
#     regional_replica_count = 1
#     storage_account_type   = "Standard_LRS"

#   }

# #   target_region {
# #     name                   = var.regionus1
# #     regional_replica_count = 1
# #     storage_account_type   = "Standard_LRS"
# #   }
#   depends_on = [
#     azurerm_managed_disk.VM-DC
#   ]
# }



