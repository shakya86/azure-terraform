terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "stterraformprodpk"
    container_name       = "tfstate"
    key                  = "prod.tfstate"

    use_oidc         = true
    use_azuread_auth = true
  }
}