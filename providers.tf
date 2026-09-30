# Configuración de proveedores para Terraform
# Este archivo define los proveedores necesarios para desplegar la infraestructura
# en Kubernetes y gestionar los recursos de ArgoCD, Prometheus y Grafana.

terraform {
  required_version = ">= 1.5.0"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.23.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.11.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
    argocd = {
      source  = "oboukili/argocd"
      version = "6.0.3"
    }
  }
}

# Proveedor de Kubernetes
provider "kubernetes" {
  host                   = var.kubernetes_host
  cluster_ca_certificate = base64decode(var.kubernetes_cluster_ca_certificate)
  token                  = var.kubernetes_token
  load_config_file       = false
}

# Proveedor de Helm
provider "helm" {
  kubernetes {
    host                   = var.kubernetes_host
    cluster_ca_certificate = base64decode(var.kubernetes_cluster_ca_certificate)
    token                  = var.kubernetes_token
  }
}

# Proveedor de kubectl
provider "kubectl" {
  host                   = var.kubernetes_host
  cluster_ca_certificate = base64decode(var.kubernetes_cluster_ca_certificate)
  token                  = var.kubernetes_token
  load_config_file       = false
}

# Proveedor de ArgoCD
provider "argocd" {
  server_addr = var.argocd_server_addr
  auth_token  = var.argocd_auth_token
  insecure    = true
}