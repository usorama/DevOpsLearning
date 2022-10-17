# AWS Resources
resource "aws_vpc" "uu_vpc" {
    cidr_block = var.vpc_range

    tags = {
      "Name" = "myvpcfromtf"
    }  
}

resource "aws_subnet" "uu-subnet" {
    vpc_id = aws_vpc.my_vpc
    cidr_block = var.address_space
  
  depends_on = [
    aws_vpc.my_vpc
  ]
}

# Azure Resources
resource "azurerm_resource_group" "uu-res-grp" {
    name = var.az_resource_group_name
    location = var.az_target_region
    tags = {
      "env" = "dev"
    }
  
}

resource "azurerm_virtual_network" "uu_vnet" {
    name = "az_subnet"
    resource_group_name = azurerm_resource_group.uu-res-grp
    location = var.az_target_region
    address_space = var.address_space

    depends_on = [
      azurerm_resource_group.uu-res-grp
    ]
  
}