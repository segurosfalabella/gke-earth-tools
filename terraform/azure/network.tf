data "azurerm_resource_group" "network" {
  name = "${var.vnet_main}"
}

data "azurerm_virtual_network" "network" {
  name                = "${var.vnet_main}"
  resource_group_name = "${var.vnet_main}"
}

resource "azurerm_subnet" "main" {
  name                 = "${var.subnet_main["name"]}"
  resource_group_name  = "${data.azurerm_resource_group.network.name}"
  virtual_network_name = "${data.azurerm_virtual_network.network.name}"
  address_prefix       = "${var.subnet_main["prefix"]}"
}
