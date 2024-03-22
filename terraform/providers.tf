terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.69.0"
    }
  }
}
provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "dev-rg"
    storage_account_name = "devxyzstorageac01"
    container_name       = "devconatiner"
    key                  = "prodacr.tfstate"
  }
}
