module "resource_group" {
  source = "../../modules/resource-group"

  name     = "rg-app-devnew"
  location = var.location

  tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

module "vnet" {
  source = "../../modules/vnet"

  name                = "vnet-app-dev"
  location            = var.location
  resource_group_name = module.resource_group.name
  address_space       = var.vnet_cidr

  tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}