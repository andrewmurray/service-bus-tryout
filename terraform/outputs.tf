output "Namespace Connection String" {
  value = "${azurerm_servicebus_namespace.sbnamespace.default_primary_connection_string}"
}

output "Shared Access Policy PrimaryKey" {
  value = "${azurerm_servicebus_namespace.sbnamespace.default_primary_key}"
}