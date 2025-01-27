terraform {
  required_version = ">= 1.0.2"

  required_providers {
    argocd = {
      source  = "argoproj-labs/argocd"
      version = "~> 7.3"
    }
  }
}
