# Terraform common modules

- [app_config](./app_config/readme.md)
- [argocd_app](,/argocd_app)
- [azure_blob_storage](./azure_blob_storage/readme.md)
- [azure_blob_storage_assets](./azure_blob_storage_assets/readme.md)
- [azure_service_bus](./azure_service_bus/readme.md)
- [key_vault](./key_vault/readme.md)
- [managed_identity](./managed_identity/readme.md)
- [mssql_database_user](./mssql_database_user/)
- [mssql_server](./mssql_server/)
- [posgresql](/postgresql/readme.md)

<!-- BEGIN_TF_DOCS -->

<!-- END_TF_DOCS -->

## Modules relationships

A birds eye view of what is managed by a module and how they would typically interact with each other. For brevity, it ignores the fact that eventually all the modules have outputs that will be stored in `app_config` (connection strings, access keys, etc)

```mermaid
flowchart BT
    subgraph managed_identity
    direction LR
    managed_identity_identity[Azure Managed Identity]
    managed_identity_workload_identity[AKS Workload Identity]
    end

    subgraph mssql_server
    direction LR
    mssql_server_server[MSSQL Server]
    mssql_server_database[MSSQL Databases]
    mssql_server_firewall[Firewall configuration]
    mssql_server_admin[MSSQL AD Admin]
    end

    subgraph mssql_database_user
    direction LR
    mssql_database_user_user[MSSQL User]
    mssql_database_user_role[MSSQL User Roles]
    end

    subgraph app_config
    direction LR
    key_vault_secrets[Key Vault Secrets]
    access_policy[Key Vault access policy for application]
    configmaps[Kubernetes Config Maps]
    secrets[Kubernetes Secrets]
    end

    subgraph key_vault
    direction LR
    key_vault_vault[Azure Key Vault]
    key_vault_deploy_policy[Key Vault access policy for management]
    end

    subgraph azure_service_bus
    direction LR
    azure_service_bus_namespace[Azure Service Bus]
    azure_service_bus_access[Access role for application]
    end

    subgraph azure_blob_storage
    direction LR
    azure_blob_storage_account[Azure Storage Account]
    azure_blob_storage_container[Blob Storage Containers]
    azure_blob_storage_access[Access role for application]
    end

    subgraph azure_blob_storage_assets
    storage_assets[Files uploaded to Blob Storage]
    end

    subgraph postgresql
    direction LR
    postgresql_server[Postgres Flexible Server]
    postgresql_database[Postgres Databases]
    postgresql_roles[Postgres Roles]
    postgresql_admin[Postgres AD Admin]
    postgresql_firewall[Firewall configuration]
    end

    mssql_database_user --> managed_identity
    app_config --> managed_identity
    mssql_database_user --> mssql_server
    app_config --> key_vault

    azure_blob_storage --> managed_identity
    azure_blob_storage_assets --> azure_blob_storage
    azure_service_bus --> managed_identity
    postgresql --> managed_identity
```
