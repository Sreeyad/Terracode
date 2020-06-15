resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.resource_group_location
}


module "vnet" {
  source  = "Azure/vnet/azurerm"
  version = "2.0.0"
  resource_group_name = azurerm_resource_group.main.name
  #name                = var.vnet_name
  address_space       = [var.address_space]
  subnet_prefixes     = var.subnet_prefixes
  subnet_names        = var.subnet_names
  tags                = var.tags

  nsg_ids = {
    subnet1 = azurerm_network_security_group.ssh.id
    
  }

}

resource "azurerm_network_security_group" "ssh" {
  #depends_on          = ["module.vnet"]
  name                = var.security_group_name
  location            = var.security_group_location
  resource_group_name = azurerm_resource_group.main.name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}

