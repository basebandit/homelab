terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "5.6.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.37.1"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "3.0.2"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_account_api_token
}

provider "kubernetes" {
  config_path    = var.kubeconfig_path
  config_context = var.kubeconfig_context
}

provider "helm" {
  kubernetes = {
    config_path    = var.kubeconfig_path
    config_context = var.kubeconfig_context
  }
}