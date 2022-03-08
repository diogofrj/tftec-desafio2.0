
[0m[3mResult #1[0m [0m[33mMEDIUM[39m[0m [1mQueue services storage account does not have logging enabled.[0m [2m[0m
[0m[0m[2m────────────────────────────────────────────────────────────────────────────────
[0m[0m [3mDesafio01/02-storage.tf [3m[2mLines 65-76
[0m[0m[2m───────┬────────────────────────────────────────────────────────────────────────[0m
[0m[0m[2m   65[0m  [2m│[0m [0m[31mresource "azurerm_storage_account" "saus2" {[0m
[0m[0m[2m   66[0m  [2m│[0m [0m[31m  name                     = "dfs${random_string.myrandom.id}desafio02"[0m
[0m[0m[2m   67[0m  [2m│[0m [0m[31m  resource_group_name      = azurerm_resource_group.rg.name[0m
[0m[0m[2m   68[0m  [2m│[0m [0m[31m  location                 = var.regionus2[0m
[0m[0m[2m   69[0m  [2m│[0m [0m[31m  account_tier             = "Standard"[0m
[0m[0m[2m   70[0m  [2m│[0m [0m[31m  account_replication_type = "LRS"[0m
[0m[0m[2m   71[0m  [2m│[0m [0m[31m  min_tls_version          = "TLS1_2"[0m
[0m[0m[2m   72[0m  [2m│[0m [0m[31m  # account_encryption_source = "Microsoft.Storage"[0m
[0m[0m[2m   73[0m  [2m│[0m [0m[31m  infrastructure_encryption_enabled = true[0m
[0m[0m[2m   74[0m  [2m│[0m [0m[31m  allow_blob_public_access          = true[0m
[0m[0m[2m   75[0m  [2m│[0m [0m[31m  tags                              = var.tags[0m
[0m[0m[2m   76[0m  [2m│[0m [0m[31m}[0m
[0m[0m[2m───────┴────────────────────────────────────────────────────────────────────────[0m
[0m[0m  [2m        ID[0m [3mazure-storage-queue-services-logging-enabled
[0m[0m  [2m    Impact[0m Logging provides valuable information about access and usage
[0m[0m  [2mResolution[0m Enable logging for Queue Services
[0m[0m
  [2mMore Information[0m[0m[0m
  [2m-[0m [34mhttps://aquasecurity.github.io/tfsec/v1.2.1/checks/azure/storage/queue-services-logging-enabled/[0m[0m
  [2m-[0m [34mhttps://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#logging[0m[0m
[2m────────────────────────────────────────────────────────────────────────────────[0m


[0m[0m[3mResult #2[0m [0m[33mMEDIUM[39m[0m [1mQueue services storage account does not have logging enabled.[0m [2m[0m
[0m[0m[2m────────────────────────────────────────────────────────────────────────────────
[0m[0m [3mDesafio01/02-storage.tf [2m[3mLines 9-20
[0m[0m[2m───────┬────────────────────────────────────────────────────────────────────────[0m
[0m[0m[2m    9[0m  [2m│[0m [0m[31mresource "azurerm_storage_account" "saus1" {[0m
[0m[0m[2m   10[0m  [2m│[0m [0m[31m  name                     = "dfs${random_string.myrandom.id}desafio01"[0m
[0m[0m[2m   11[0m  [2m│[0m [0m[31m  resource_group_name      = azurerm_resource_group.rg.name[0m
[0m[0m[2m   12[0m  [2m│[0m [0m[31m  location                 = var.regionus1[0m
[0m[0m[2m   13[0m  [2m│[0m [0m[31m  account_tier             = "Standard"[0m
[0m[0m[2m   14[0m  [2m│[0m [0m[31m  account_replication_type = "LRS"[0m
[0m[0m[2m   15[0m  [2m│[0m [0m[31m  min_tls_version          = "TLS1_2"[0m
[0m[0m[2m   16[0m  [2m│[0m [0m[31m  # account_encryption_source = "Microsoft.Storage"[0m
[0m[0m[2m   17[0m  [2m│[0m [0m[31m  infrastructure_encryption_enabled = true[0m
[0m[0m[2m   18[0m  [2m│[0m [0m[31m  allow_blob_public_access          = true[0m
[0m[0m[2m   19[0m  [2m│[0m [0m[31m  tags                              = var.tags[0m
[0m[0m[2m   20[0m  [2m│[0m [0m[31m}[0m
[0m[0m[2m───────┴────────────────────────────────────────────────────────────────────────[0m
[0m[0m  [2m        ID[0m [3mazure-storage-queue-services-logging-enabled
[0m[0m  [2m    Impact[0m Logging provides valuable information about access and usage
[0m[0m  [2mResolution[0m Enable logging for Queue Services
[0m[0m
  [2mMore Information[0m[0m[0m
  [2m-[0m [34mhttps://aquasecurity.github.io/tfsec/v1.2.1/checks/azure/storage/queue-services-logging-enabled/[0m[0m
  [2m-[0m [34mhttps://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#logging[0m[0m
[2m────────────────────────────────────────────────────────────────────────────────[0m


[0m[0m  [1mtimings[0m
  ──────────────────────────────────────────
[0m[0m  [2mdisk i/o            [0m 385µs
[0m[0m  [2mparsing             [0m 12.0251ms
[0m[0m  [2madaptation          [0m 178.6µs
[0m[0m  [2mchecks              [0m 4.1043ms
[0m[0m  [2mtotal               [0m 16.693ms
[0m
[0m  [1mcounts[0m
  ──────────────────────────────────────────
[0m[0m  [2mblocks              [0m 60
[0m[0m  [2mmodules             [0m 2
[0m[0m  [2mfiles               [0m 22
[0m
[0m  [1mresults[0m
  ──────────────────────────────────────────
[0m[0m  [2mignored             [0m 0
[0m[0m  [2mexcluded            [0m 0
[0m[0m  [2mcritical            [0m 0
[0m[0m  [2mhigh                [0m 0
[0m[0m  [2mmedium              [0m 2
[0m[0m  [2mlow                 [0m 0
[0m
[0m  [31m[1m2 potential problem(s) detected.

[0m