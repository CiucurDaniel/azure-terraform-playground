# Terraform configure block

terraform {

  # list required providers, in this case just the azure provider  
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.28.0"
    }
  }

# Add sotrage backend -> Terraform will us this to store state automatically, no other config needed
  backend "azurerm" {
        resource_group_name  = "tfstate-rg"
        storage_account_name = "tfstatestorageacc1234"
        container_name       = "terraform-state"
        key                  = "terraform.tfstate"
    }

}

# Configuration for the provider itself

provider "azurerm" {
  features {}
}


# Create your resources ...

resource "azurerm_resource_group" "example" {
  name     = "example"
  location = "West Europe"
}