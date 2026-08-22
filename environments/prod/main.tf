module "resource_group" {
  source = "../../modules/resource-group"

  name     = "rg-app-prod"
  location = var.location

  tags = {
    Environment = "prod"
    ManagedBy   = "Terraform"
  }
}

module "vnet" {
  source = "../../modules/vnet"

  name                = "vnet-app-prod"
  location            = var.location
  resource_group_name = module.resource_group.name
  address_space       = var.vnet_cidr

  tags = {
    Environment = "prod"
    ManagedBy   = "Terraform"
  }
}