plugin "terraform" {
  enabled = true
  preset  = "recommended"
}

plugin "azurerm" {
  enabled = true
  version = "0.30.0"
  source  = "github.com/terraform-linters/tflint-ruleset-azurerm"
}

# Deletion protection is expected to be enforced by Azure management locks.
rule "azurerm_resources_missing_prevent_destroy" {
  enabled = false
}