#terraform script
resource "azurerm_resource_group" "rg" {
  name     = "testdemo"
  location = "west europe"
}

resource "azurerm_app_service_plan" "plan" {
  name                = "example-appserviceplan"
  location            = "west europe"
  resource_group_name = "testdemo"

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "app-service" {
  name                = var.app-service-name
  location            = "west europe"
  resource_group_name = "testdemo"
  app_service_plan_id = azurerm_app_service_plan.plan.id
}

resource "azurerm_sql_server" "sqldb" {
  name                         = "terraform-sqlserver"
  resource_group_name          = "testdemo"
  location                     = "west europe"
  version                      = "12.0"
  administrator_login          = "houssem"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}

resource "azurerm_sql_database" "db" {
  name                = "terraform-sqldatabase"
  resource_group_name = "testdemo"
  location            = "west europe"
  server_name         = azurerm_sql_server.sqldb.name

  tags = {
    environment = "Development"
  }
}
