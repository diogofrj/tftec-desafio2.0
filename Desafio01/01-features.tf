#https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/features-block
provider "azurerm" {
  features {
    virtual_machine {
      delete_os_disk_on_deletion = false
    }
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
}


provider "azuredevops" {
  org_service_url       = var.url_org
  personal_access_token = var.tokendevops
}