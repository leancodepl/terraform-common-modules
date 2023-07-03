terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.58"
    }
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "~> 1.17"
    }
  }
}

provider "postgresql" {
  host      = azurerm_postgresql_flexible_server.main.fqdn
  database  = "postgres"
  username  = azurerm_postgresql_flexible_server.main.administrator_login
  password  = random_password.db_admin.result
  superuser = false
  sslmode   = "verify-full"
}
