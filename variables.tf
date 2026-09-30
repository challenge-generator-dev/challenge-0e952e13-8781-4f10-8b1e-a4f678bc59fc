# Variables para la configuración de Terraform
# Estas variables permiten parametrizar la infraestructura y conectar con el cluster de Kubernetes.

variable "kubernetes_host" {
  description = "Host del cluster de Kubernetes"
  type        = string
}

variable "kubernetes_cluster_ca_certificate" {
  description = "Certificado CA del cluster de Kubernetes en base64"
  type        = string
}

variable "kubernetes_token" {
  description = "Token de autenticación para el cluster de Kubernetes"
  type        = string
  sensitive   = true
}

variable "argocd_server_addr" {
  description = "Dirección del servidor de ArgoCD"
  type        = string
}

variable "argocd_auth_token" {
  description = "Token de autenticación para ArgoCD"
  type        = string
  sensitive   = true
}

variable "namespace" {
  description = "Namespace donde se desplegarán los recursos"
  type        = string
  default     = "microservices"
}

variable "argocd_namespace" {
  description = "Namespace donde se desplegará ArgoCD"
  type        = string
  default     = "argocd"
}

variable "prometheus_namespace" {
  description = "Namespace donde se desplegará Prometheus"
  type        = string
  default     = "monitoring"
}

variable "grafana_namespace" {
  description = "Namespace donde se desplegará Grafana"
  type        = string
  default     = "monitoring"
}

variable "microservices" {
  description = "Lista de microservicios a desplegar"
  type = list(object({
    name      = string
    chart     = string
    version   = string
    namespace = string
  }))
  default = [
    {
      name      = "auth-service"
      chart     = "./microservices/auth-service"
      version   = "0.1.0"
      namespace = "microservices"
    },
    {
      name      = "user-service"
      chart     = "./microservices/user-service"
      version   = "0.1.0"
      namespace = "microservices"
    },
    {
      name      = "payment-service"
      chart     = "./microservices/payment-service"
      version   = "0.1.0"
      namespace = "microservices"
    }
  ]
}