terraform {
    required_version = ">= 0.14"
  required_providers {
    azurerm = {
        source  = "hashicorp/azurerm"
        version = "5.0.0"
    }
  }
}
provider "azurerm" {
  features {
  }
  subscription_id = "a0af25b9-387e-4c4e-9aa7-0904558bfa48"
}