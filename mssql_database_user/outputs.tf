output "managed_identity_connection_string" {
  value = join(";", [
    "Server=tcp:${var.database.fqdn},1433",
    "Initial Catalog=${var.database.name}",
    "Persist Security Info=False;MultipleActiveResultSets=False;Encrypt=True",
    "TrustServerCertificate=False;Connection Timeout=30;Max Pool Size=30",
    "Authentication=Active Directory Default",
  ])
}

output "db_user_id" {
  value = mssql_azuread_service_principal.user.id
}
