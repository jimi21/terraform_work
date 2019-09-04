resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.name
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = var.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefix       = "10.0.2.0/24"
}

resource "azurerm_network_interface" "main" {
  name                = "${var.prefix}-jimi"
  location            = var.location
  resource_group_name = var.name

  ip_configuration {
    name                          = var.ip_conf_name
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.test.id
  }
}

resource "azurerm_public_ip" "test" {
  name                = "PublicIp1"
  location            = var.location
  resource_group_name = var.name
  allocation_method   = "Static"
}
