variable "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

variable "sql_server_name" {
  value = azurerm_mssql_server.server.name
}


variable "admin_password" {
  sensitive = true
  value     = local.admin_password
}
