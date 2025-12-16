terraform {
  required_version = ">= 1.14.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.3"
    }
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "~> 1.17"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
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
