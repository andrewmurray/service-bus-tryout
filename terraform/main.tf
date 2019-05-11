provider azurerm {}

provider tls {}

resource "azurerm_resource_group" "rg" {
  name     = "amu-service-bus-tryout-rg"
  location = "uksouth"

  tags = {
    environment = "Development"
  }
}

resource "azurerm_servicebus_namespace" "amu_service_bus_tryout" {
  name                = "amu-service-bus-tryout"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  location            = "${azurerm_resource_group.rg.location}"
  sku                 = "Standard"
}
