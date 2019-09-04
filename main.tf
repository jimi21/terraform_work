resource "azurerm_resource_group" "main" {
  name     = "${var.prefix}-resources"
  location = var.rg_location
}

module "my_vm" {
  source = "./VM/"
  location = azurerm_resource_group.main.location
  name = azurerm_resource_group.main.name
  netid = module.my_vnet.network_interface_id
  prefix = var.prefix
}

module "my_vnet" {
  source = "./Vnet/"
  location = azurerm_resource_group.main.location
  name = azurerm_resource_group.main.name
  prefix = var.prefix
}

provider "azurerm" {
  version = "=1.33.1"
}
