resource "azurerm_managed_disk" "VM-DC" {
  create_option                 = "Import"
  disk_size_gb                  = 128
  hyper_v_generation            = "V2"
  location                      = var.regionus2
  name                          = "VM-DC-OSDisk"
  on_demand_bursting_enabled    = false
  os_type                       = "Windows"
  public_network_access_enabled = true
  resource_group_name           = azurerm_resource_group.rg.name
  source_uri                    = "${azurerm_storage_container.saus2.id}/vm-dc.vhd"
  storage_account_id            = azurerm_storage_account.saus2.id
  storage_account_type          = "Standard_LRS"
  tags                          = var.tags
  trusted_launch_enabled        = false
  zones                         = []
}

resource "azurerm_managed_disk" "VM-HELP" {
  create_option                 = "Import"
  disk_size_gb                  = 32
  hyper_v_generation            = "V2"
  location                      = var.regionus2
  name                          = "VM-HELP-OSDisk"
  on_demand_bursting_enabled    = false
  os_type                       = "Linux"
  public_network_access_enabled = true
  resource_group_name           = azurerm_resource_group.rg.name
  source_uri                    = "${azurerm_storage_container.saus2.id}/vm-helpdesk.vhd"
  storage_account_id            = azurerm_storage_account.saus2.id
  storage_account_type          = "Standard_LRS"
  tags                          = var.tags
  trusted_launch_enabled        = false
  zones                         = []
}

# # US1

resource "azurerm_managed_disk" "VM-SQL" {
    create_option                 = "Import"
    disk_size_gb                  = 128
    hyper_v_generation            = "V2"
    location                      = var.regionus1
    name                          = "VM-SQL-OSDisk"
    on_demand_bursting_enabled    = false
    os_type                       = "Windows"
    public_network_access_enabled = true
    resource_group_name           = azurerm_resource_group.rg.name
    source_uri                    = "${azurerm_storage_container.saus1.id}/vmsqlserver.vhd"
    storage_account_id            = azurerm_storage_account.saus1.id
    storage_account_type          = "Standard_LRS"
    tags                          = var.tags
    trusted_launch_enabled        = false
    zones                         = []
}


resource "azurerm_managed_disk" "VM-PORTAL" {
    create_option                 = "Import"
    disk_size_gb                  = 128
    hyper_v_generation            = "V2"
    location                      = var.regionus1
    name                          = "VM-PORTAL-OSDisk"
    on_demand_bursting_enabled    = false
    os_type                       = "Windows"
    public_network_access_enabled = true
    resource_group_name           = azurerm_resource_group.rg.name
    source_uri                    = "${azurerm_storage_container.saus1.id}/vm-portal.vhd"
    storage_account_id            = azurerm_storage_account.saus1.id
    storage_account_type          = "Standard_LRS"
    tags                          = var.tags
    trusted_launch_enabled        = false
    zones                         = []
}