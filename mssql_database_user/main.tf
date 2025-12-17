/**
 * # MSSQL user module
 * The module creates an SQL user mapped to an Azure AD Idenity.
 *
 * **WARNING**: This module will raise an error on plan if the database does not exist yet. If you configure the database and user in the same project, make sure to partially apply database first. 
 */
terraform {
  required_version = ">= 1.14.0"

  required_providers {
    mssql = {
      source  = "PGSSoft/mssql"
      version = "~> 0.6"
    }
  }
}

data "mssql_database" "database" {
  name = var.database.name
}
