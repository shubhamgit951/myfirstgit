
resource "azurerm_public_ip" "pip" {

  name                = "terraform-pip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  allocation_method = "Static"

  sku = "Standard"

}

resource "azurerm_network_interface" "nic" {

  name                = var.nic_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {

    name = "internal"

    subnet_id = azurerm_subnet.subnet.id

    private_ip_address_allocation = "Dynamic"

    public_ip_address_id = azurerm_public_ip.pip.id

  }

}

resource "azurerm_network_interface_security_group_association" "association" {

  network_interface_id = azurerm_network_interface.nic.id

  network_security_group_id = azurerm_network_security_group.nsg.id

}