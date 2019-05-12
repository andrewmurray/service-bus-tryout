provider azurerm {}

provider tls {}

resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-rg"
  location = "${var.location}"

  tags = {
    environment = "Development"
  }}

resource "azurerm_servicebus_namespace" "sbnamespace" {
  name                = "${var.prefix}-sbnamespace"
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  sku                 = "Standard"
}

resource "azurerm_servicebus_namespace_authorization_rule" "authrule" {
  name                = "${var.prefix}-sbnauth"
  namespace_name      = "${azurerm_servicebus_namespace.sbnamespace.name}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  send                = true
  listen              = true
  manage              = true
}

resource "azurerm_servicebus_topic" "topic" {
  name                = "${var.prefix}-sbtopic"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  namespace_name      = "${azurerm_servicebus_namespace.sbnamespace.name}"
  enable_partitioning = true
}

resource "azurerm_servicebus_subscription" "subscription" {
  name                = "${var.prefix}-sbsubscription"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  namespace_name      = "${azurerm_servicebus_namespace.sbnamespace.name}"
  topic_name          = "${azurerm_servicebus_topic.topic.name}"
  max_delivery_count  = 1
}

resource "azurerm_servicebus_queue" "queue" {
  name                = "${var.prefix}-sbqueue"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  namespace_name      = "${azurerm_servicebus_namespace.sbnamespace.name}"
  enable_partitioning = true
}