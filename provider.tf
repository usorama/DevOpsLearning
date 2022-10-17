# AWS Provider
provider "aws" {
    region      = var.aws_target_region
}

# Azure Provider
provider "azurerm" {
    features {}
  
}