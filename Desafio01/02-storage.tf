# Resource-2: Random String 
resource "random_string" "myrandom" {
  length  = 3
  upper   = false
  special = false
}

# Resource-3: Azure Storage Account 
resource "azurerm_storage_account" "saus1" {
  name                     = "dfs${random_string.myrandom.id}desafio01"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.regionus1
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
  # account_encryption_source = "Microsoft.Storage"
  infrastructure_encryption_enabled = true
  allow_blob_public_access          = true
  tags                              = var.tags
}

resource "azurerm_storage_container" "saus1" {
  name                  = "vhd"
  storage_account_name  = azurerm_storage_account.saus1.name
  container_access_type = "private"
}

data "azurerm_storage_account_blob_container_sas" "saus1" {
  connection_string = azurerm_storage_account.saus1.primary_connection_string
  container_name    = azurerm_storage_container.saus1.name
  https_only        = true

  #ip_address = "${chomp(data.http.clientip.body)}"

  start  = "2022-03-03"
  expiry = "2022-03-30"

  permissions {
    read   = true
    add    = true
    create = true
    write  = true
    delete = false
    list   = true
  }

  cache_control       = "max-age=5"
  content_disposition = "inline"
  content_encoding    = "deflate"
  content_language    = "en-US"
  content_type        = "application/json"
}

output "saus1_sas_url_query_string" {
  value = format("%s%s", azurerm_storage_container.saus1.id, nonsensitive(data.azurerm_storage_account_blob_container_sas.saus1.sas))
}
output "name_saus1" {
  value       = azurerm_storage_account.saus1.name
  description = "The name of the Storage Account."
}



# Resource-3: Azure Storage Account 
resource "azurerm_storage_account" "saus2" {
  name                     = "dfs${random_string.myrandom.id}desafio02"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.regionus2
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
  # account_encryption_source = "Microsoft.Storage"
  infrastructure_encryption_enabled = true
  allow_blob_public_access          = true
  tags                              = var.tags
}

resource "azurerm_storage_container" "saus2" {
  name                  = "vhd"
  storage_account_name  = azurerm_storage_account.saus2.name
  container_access_type = "private"
}

data "azurerm_storage_account_blob_container_sas" "saus2" {
  connection_string = azurerm_storage_account.saus2.primary_connection_string
  container_name    = azurerm_storage_container.saus2.name
  https_only        = true

  #ip_address = "${chomp(data.http.clientip.body)}"

  start  = "2022-03-03"
  expiry = "2022-03-30"

  permissions {
    read   = true
    add    = true
    create = true
    write  = true
    delete = false
    list   = true
  }

  cache_control       = "max-age=5"
  content_disposition = "inline"
  content_encoding    = "deflate"
  content_language    = "en-US"
  content_type        = "application/json"
}

output "saus2_sas_url_query_string" {
  value = format("%s%s", azurerm_storage_container.saus2.id, nonsensitive(data.azurerm_storage_account_blob_container_sas.saus2.sas))
}
output "name_saus2" {
  value       = azurerm_storage_account.saus2.name
  description = "The name of the Storage Account."
}
