
resource "azurerm_public_ip" "pip_vm-dc" {
  name                = "VM-DC-PIP"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.regionus2
  allocation_method   = "Dynamic"
  tags                = var.tags
  domain_name_label = "vmdcdesafio"
}

resource "azurerm_network_interface" "nic_vm-dc" {
  name                = "VM-DC-nic"
  location            = var.regionus2
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subus2.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.1.0.4"
    public_ip_address_id          = azurerm_public_ip.pip_vm-dc.id
  }
  depends_on = [
    azurerm_subnet.subus2
  ]
}

resource "azurerm_public_ip" "pip_vm-help" {
  name                = "VM-HELP-PIP"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.regionus2
  allocation_method   = "Dynamic"
  tags                = var.tags
  domain_name_label = "vmhelpdesafio"
}
resource "azurerm_network_interface" "nic_vm-help" {
  name                = "VM-HELP-nic"
  location            = var.regionus2
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subus2.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.1.0.5"
    public_ip_address_id          = azurerm_public_ip.pip_vm-help.id
  }
  depends_on = [
    azurerm_subnet.subus2
  ]
}



resource "azurerm_public_ip" "pip_vm-sql" {
  name                = "VM-SQL-PIP"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.regionus1
  allocation_method   = "Dynamic"
  tags                = var.tags
  domain_name_label = "vmsqldesafio"
}
resource "azurerm_network_interface" "nic_vm-sql" {
  name                = "VM-SQL-nic"
  location            = var.regionus1
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subus1.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.0.4"
    public_ip_address_id          = azurerm_public_ip.pip_vm-sql.id
  }
  depends_on = [
    azurerm_subnet.subus1
  ]
}





resource "azurerm_public_ip" "pip_vm-portal" {
  name                = "VM-PORTAL-PIP"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.regionus1
  allocation_method   = "Dynamic"
  tags                = var.tags
  domain_name_label = "vmportaldesafio"
}
resource "azurerm_network_interface" "nic_vm-portal" {
  name                = "VM-PORTAL-nic"
  location            = var.regionus1
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subus1.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.0.5"
    public_ip_address_id          = azurerm_public_ip.pip_vm-portal.id
  }
  depends_on = [
    azurerm_subnet.subus1
  ]
}










# resource "azurerm_virtual_machine" "VM-DC" {
#   name                  = "VM-DC"
#   location              = var.regionus2
#   resource_group_name   = azurerm_resource_group.rg.name
#   network_interface_ids = [azurerm_network_interface.nic_vm-dc.id]
#   vm_size               = "Standard_E2as_v5"

# storage_image_reference {

# }
#   storage_os_disk {
#     managed_disk_id = azurerm_managed_disk.VM-DC.id
#     # vhd_uri           = "${azurerm_storage_container.saus2.id}/vm-dc.vhd"
#     caching           = "ReadWrite"
#     create_option     = "Attach"
#     managed_disk_type = "Standard_LRS"
#     os_type           = "Windows"
#     name              = "VM-DC-OSDisk"

#   }
#   os_profile {
#     computer_name  = "VM-DC"
#     admin_username = "azadmin"
#     admin_password = "Partiunuvem@123"
#   }
#   os_profile_windows_config {
#     provision_vm_agent = true
#     timezone           = "E. South America Standard Time"
#   }
#   license_type = "Windows_Server"
#   boot_diagnostics {
#     enabled = true
#     storage_uri = "https://dfs76ddesafio02.blob.core.windows.net"
#   }

# }





# # resource "azurerm_windows_virtual_machine" "VM-DC" {
# #   name                = "VM-DC"
# #   resource_group_name = azurerm_resource_group.rg.name
# #   location            = var.regionus2
# #   size                = "Standard_E2as_v5"
# #   admin_username      = "azadmin"
# #   admin_password      = "Partiunuvem@123"
# #   network_interface_ids = [
# #     azurerm_network_interface.nic_vm-dc.id,
# #   ]

# #   os_disk {
# #     caching              = "ReadWrite"
# #     storage_account_type = "Standard_LRS"
# #     name                 = "VM-DC-OS-Disk"
# #   }
# #   provision_vm_agent = true
# #   source_image_id    = azurerm_shared_image_version.imagever_vmdc.id
# #   boot_diagnostics {
# #     storage_account_uri = "https://dfs76ddesafio02.blob.core.windows.net"
# #   }
# #   license_type = "Windows_Server"
# #   timezone     = "E. South America Standard Time"
# #   #   source_image_reference {
# #   #     publisher = "MicrosoftWindowsServer"
# #   #     offer     = "WindowsServer"
# #   #     sku       = "2016-Datacenter"
# #   #     version   = "latest"
# #   #   }
# #   # depends_on = [
# #   #   azurerm_network_interface.nic_vm-dc,
# #   # ]
# # }