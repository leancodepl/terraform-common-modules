terraform {
  required_version = ">= 1.0.2"

  required_providers {
    argocd = {
      source  = "oboukili/argocd"
      version = "~> 6.1"
    }
  }
}
