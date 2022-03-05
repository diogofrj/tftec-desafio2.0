terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.98.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.18.0"
    }
    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }
    # https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs    
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "0.2.0"

    }
  }
}

