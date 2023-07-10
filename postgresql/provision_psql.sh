#!/usr/bin/env bash
set -e

postgres_config_output_name=${1:-postgres_ad_roles_config}
config=$(terraform output -json "$postgres_config_output_name")

libpg_base_connection_string=$(jq -r '.config.libpg_base_connection_string' <<< "$config")
administrator_login=$(jq -r '.config.administrator_login' <<< "$config")
administrator_password=$(jq -r '.config.administrator_password' <<< "$config")
ad_administrator_login=$(jq -r '.config.ad_administrator_login' <<< "$config")
setup_roles=$(jq -r  ".ad_roles_setup_script" <<< "$config")
setup_grants=$(jq -r  ".ad_grants_setup_script" <<< "$config")

ad_admin_token=$(az account get-access-token -t "${tenant_id}" --resource-type oss-rdbms --query accessToken -o tsv)

export PGDATABASE='postgres'
export PGUSER="${ad_administrator_login}"
export PGPASSWORD="${ad_admin_token}"

psql "${libpg_base_connection_string}" <<< "$setup_roles"

export PGUSER="${administrator_login}"
export PGPASSWORD="${administrator_password}"
psql "${libpg_base_connection_string}" <<< "$setup_grants"
