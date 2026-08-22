module "resource_group" {
  source = "../../modules/resource-group"

  name     = "rg-app-qa"
  location = var.location

  tags = {
    Environment = "qa"
    ManagedBy   = "Terraform"
  }
}

module "vnet" {
  source = "../../modules/vnet"

  name                = "vnet-app-qa"
  location            = var.location
  resource_group_name = module.resource_group.name
  address_space       = var.vnet_cidr

  tags = {
    Environment = "qa"
    ManagedBy   = "Terraform"
  }
}