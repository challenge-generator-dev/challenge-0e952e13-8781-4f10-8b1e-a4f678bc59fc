terraform {
  required_version = ">= 1.5.0"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.23.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.11.0"
    }
  }

  backend "s3" {
    bucket = "terraform-state-microservices-platform"
    key    = "production/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "kubernetes" {
  config_path    = var.kubeconfig_path
  config_context = var.cluster_context
}

provider "helm" {
  kubernetes {
    config_path    = var.kubeconfig_path
    config_context = var.cluster_context
  }
  debug = false
}

resource "kubernetes_namespace" "platform" {
  metadata {
    name = "microservices-platform"
    labels = {
      name                                        = "microservices-platform"
      "istio-injection"                          = "enabled"
      "environment"                              = "production"
      "pod-security.kubernetes.io/enforce"       = "restricted"
      "pod-security.kubernetes.io/audit"         = "restricted"
      "pod-security.kubernetes.io/warn"          = "restricted"
    }
  }
}

resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
    labels = {
      name                                        = "monitoring"
      "pod-security.kubernetes.io/enforce"       = "restricted"
      "pod-security.kubernetes.io/audit"         = "restricted"
      "pod-security.kubernetes.io/warn"          = "restricted"
    }
  }
}

resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
    labels = {
      name                                        = "argocd-system"
      "pod-security.kubernetes.io/enforce"       = "restricted"
      "pod-security.kubernetes.io/audit"         = "restricted"
      "pod-security.kubernetes.io/warn"          = "restricted"
    }
  }
}

resource "kubernetes_config_map" "cluster_config" {
  metadata {
    name      = "cluster-config"
    namespace = kubernetes_namespace.platform.metadata[0].name
  }

  data = {
    "cluster-name"    = var.cluster_name
    "environment"     = var.environment
    "region"          = var.aws_region
    "node-count"      = var.node_count
    "instance-type"   = var.instance_type
  }
}

resource "kubernetes_secret" "docker_registry" {
  metadata {
    name      = "docker-registry-secret"
    namespace = kubernetes_namespace.platform.metadata[0].name
  }

  type = "kubernetes.io/dockerconfigjson"

  data = {
    ".dockerconfigjson" = var.docker_config_json
  }
}

resource "kubernetes_secret" "tls_certificates" {
  metadata {
    name      = "tls-certificates"
    namespace = kubernetes_namespace.platform.metadata[0].name
  }

  type = "kubernetes.io/tls"

  data = {
    "tls.crt" = var.tls_certificate
    "tls.key" = var.tls_private_key
  }
}

resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.8.0"
  namespace  = kubernetes_namespace.argocd.metadata[0].name
  create_namespace = false

  values = [file("${path.module}/values/argocd-values.yaml")]

  set {
    name  = "server.service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "server.ingress.enabled"
    value = "true"
  }

  set {
    name  = "server.ingress.hostname"
    value = var.argocd_hostname
  }

  set {
    name  = "server.ingress.annotations.nginx\.ingress\.kubernetes\.io/ssl-redirect"
    value = "true"
  }

  set {
    name  = "redis.enabled"
    value = "true"
  }

  set {
    name  = "controller.replicas"
    value = var.argocd_controller_replicas
  }

  set {
    name  = "server.replicas"
    value = var.argocd_server_replicas
  }

  set {
    name  = "repoServer.replicas"
    value = var.argocd_repo_server_replicas
  }

  depends_on = [
    kubernetes_namespace.argocd
  ]
}

resource "helm_release" "prometheus" {
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  version    = "25.0.0"
  namespace  = kubernetes_namespace.monitoring.metadata[0].name
  create_namespace = false

  values = [file("${path.module}/values/prometheus-values.yaml")]

  set {
    name  = "server.persistentVolume.enabled"
    value = "true"
  }

  set {
    name  = "server.persistentVolume.size"
    value = "50Gi"
  }

  set {
    name  = "server.retention"
    value = "30d"
  }

  set {
    name  = "server.service.type"
    value = "ClusterIP"
  }

  set {
    name  = "alertmanager.enabled"
    value = "true"
  }

  set {
    name  = "alertmanager.replicas"
    value = var.alertmanager_replicas
  }

  set {
    name  = "pushgateway.enabled"
    value = "true"
  }

  set {
    name  = "kubeStateMetrics.enabled"
    value = "true"
  }

  set {
    name  = "nodeExporter.enabled"
    value = "true"
  }

  depends_on = [
    kubernetes_namespace.monitoring
  ]
}

resource "helm_release" "grafana" {
  name       = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  version    = "6.58.0"
  namespace  = kubernetes_namespace.monitoring.metadata[0].name
  create_namespace = false

  values = [file("${path.module}/values/grafana-values.yaml")]

  set {
    name  = "service.type"
    value = "ClusterIP"
  }

  set {
    name  = "persistence.enabled"
    value = "true"
  }

  set {
    name  = "persistence.size"
    value = "10Gi"
  }

  set {
    name  = "admin.user"
    value = var.grafana_admin_user
  }

  set {
    name  = "admin.password"
    value = var.grafana_admin_password
    sensitive = true
  }

  set {
    name  = "ingress.enabled"
    value = "true"
  }

  set {
    name  = "ingress.hosts[0]"
    value = var.grafana_hostname
  }

  set {
    name  = "ingress.tls[0].secretName"
    value = "grafana-tls"
  }

  set {
    name  = "ingress.tls[0].hosts[0]"
    value = var.grafana_hostname
  }

  set {
    name  = "datasources.datasources\.yaml.apiVersion"
    value = "1"
  }

  set {
    name  = "datasources.datasources\.yaml.datasources[0].name"
    value = "Prometheus"
  }

  set {
    name  = "datasources.datasources\.yaml.datasources[0].type"
    value = "prometheus"
  }

  set {
    name  = "datasources.datasources\.yaml.datasources[0].access"
    value = "proxy"
  }

  set {
    name  = "datasources.datasources\.yaml.datasources[0].url"
    value = "http://prometheus-server.monitoring.svc.cluster.local:9090"
  }

  depends_on = [
    kubernetes_namespace.monitoring,
    helm_release.prometheus
  ]
}

resource "helm_release" "ingress_nginx" {
  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "4.8.0"
  namespace  = "ingress-nginx"
  create_namespace = true

  set {
    name  = "controller.service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "controller.service.annotations.service\.beta\.kubernetes\.io/aws-load-balancer-type"
    value = "nlb"
  }

  set {
    name  = "controller.replicaCount"
    value = var.ingress_replicas
  }

  set {
    name  = "controller.metrics.enabled"
    value = "true"
  }

  set {
    name  = "controller.metrics.serviceMonitor.enabled"
    value = "true"
  }

  set {
    name  = "controller.metrics.serviceMonitor.namespace"
    value = "monitoring"
  }

  set {
    name  = "controller.resources.requests.memory"
    value = "256Mi"
  }

  set {
    name  = "controller.resources.requests.cpu"
    value = "500m"
  }

  set {
    name  = "controller.resources.limits.memory"
    value = "512Mi"
  }

  set {
    name  = "controller.resources.limits.cpu"
    value = "1000m"
  }
}

resource "helm_release" "cert_manager" {
  name       = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = "1.13.0"
  namespace  = "cert-manager"
  create_namespace = true

  set {
    name  = "installCRDs"
    value = "true"
  }

  set {
    name  = "replicaCount"
    value = var.cert_manager_replicas
  }

  set {
    name  = "webhook.replicaCount"
    value = var.cert_manager_replicas
  }

  set {
    name  = "cainjector.replicaCount"
    value = var.cert_manager_replicas
  }
}

resource "kubernetes_ingress_class" "nginx" {
  metadata {
    name = "nginx"
    annotations = {
      "ingressclass.kubernetes.io/is-default-class" = "true"
    }
  }
  spec {
    controller = "k8s.io/ingress-nginx"
  }
}

resource "kubernetes_issuer" "letsencrypt_production" {
  metadata {
    name      = "letsencrypt-prod"
    namespace = kubernetes_namespace.platform.metadata[0].name
  }
  spec {
    acme {
      server = "https://acme-v02.api.letsencrypt.org/directory"
      email  = var.letsencrypt_email

      private_key_secret_ref {
        name = "letsencrypt-prod"
      }

      solvers {
        http01 {
          ingress {
            class = "nginx"
          }
        }
      }
    }
  }
}

resource "kubernetes_issuer" "letsencrypt_staging" {
  metadata {
    name      = "letsencrypt-staging"
    namespace = kubernetes_namespace.platform.metadata[0].name
  }
  spec {
    acme {
      server = "https://acme-staging-v02.api.letsencrypt.org/directory"
      email  = var.letsencrypt_email

      private_key_secret_ref {
        name = "letsencrypt-staging"
      }

      solvers {
        http01 {
          ingress {
            class = "nginx"
          }
        }
      }
    }
  }
}

resource "kubernetes_resource_quota" "platform_quota" {
  metadata {
    name      = "platform-resource-quota"
    namespace = kubernetes_namespace.platform.metadata[0].name
  }

  spec {
    hard = {
      "requests.cpu"    = "32"
      "requests.memory" = "64Gi"
      "limits.cpu"      = "64"
      "limits.memory"   = "128Gi"
      "pods"            = "100"
      "services"        = "20"
      "secrets"         = "50"
      "configmaps"      = "50"
      "persistentvolumeclaims" = "20"
    }

    scope_selector {
      match_expressions {
        operator       = "In"
        scope_name     = "PriorityClass"
        values         = ["high", "medium", "low"]
      }
    }
  }
}

resource "kubernetes_limit_range" "platform_limits" {
  metadata {
    name      = "platform-resource-limits"
    namespace = kubernetes_namespace.platform.metadata[0].name
  }

  spec {
    limits {
      type = "Container"
      default_request {
        cpu    = "250m"
        memory = "256Mi"
      }
      default_limit {
        cpu    = "500m"
        memory = "512Mi"
      }
      max_request {
        cpu    = "4000m"
        memory = "8Gi"
      }
      min_request {
        cpu    = "100m"
        memory = "128Mi"
      }
    }

    limits {
      type = "PersistentVolumeClaim"
      max {
        storage = "100Gi"
      }
      min {
        storage = "1Gi"
      }
    }
  }
}

resource "kubernetes_network_policy" "platform_network_policy" {
  metadata {
    name      = "platform-network-policy"
    namespace = kubernetes_namespace.platform.metadata[0].name
  }

  spec {
    pod_selector {
      match_labels = {
        app = "microservice"
      }
    }

    policy_types = ["Ingress", "Egress"]

    ingress {
      from {
        pod_selector {
          match_labels = {
            app = "microservice"
          }
        }
      }
      from {
        namespace_selector {
          match_labels = {
            name = "ingress-nginx"
          }
        }
      }
      from {
        namespace_selector {
          match_labels = {
            name = "monitoring"
          }
        }
      }
      ports {
        protocol = "TCP"
        port     = "8080"
      }
      ports {
        protocol = "TCP"
        port     = "8081"
      }
      ports {
        protocol = "TCP"
        port     = "9090"
      }
    }

    egress {
      to {
        pod_selector {}
      }
      to {
        namespace_selector {
          match_labels = {
            name = "kube-system"
          }
        }
      }
      to {
        namespace_selector {
          match_labels = {
            name = "monitoring"
          }
        }
      }
      ports {
        protocol = "TCP"
        port     = "53"
      }
      ports {
        protocol = "UDP"
        port     = "53"
      }
      ports {
        protocol = "TCP"
        port     = "443"
      }
      ports {
        protocol = "TCP"
        port     = "80"
      }
    }
  }
}

output "cluster_name" {
  value       = var.cluster_name
  description = "Nombre del cluster de Kubernetes"
}

output "platform_namespace" {
  value       = kubernetes_namespace.platform.metadata[0].name
  description = "Namespace principal de la plataforma de microservicios"
}

output "monitoring_namespace" {
  value       = kubernetes_namespace.monitoring.metadata[0].name
  description = "Namespace de monitoreo"
}

output "argocd_namespace" {
  value       = kubernetes_namespace.argocd.metadata[0].name
  description = "Namespace de ArgoCD"
}

output "argocd_url" {
  value       = "https://${var.argocd_hostname}"
  description = "URL de acceso a ArgoCD"
}

output "grafana_url" {
  value       = "https://${var.grafana_hostname}"
  description = "URL de acceso a Grafana"
}

output "ingress_ip" {
  value       = "Pending (obtener del servicio ingress-nginx-controller)"
  description = "IP del balanceador de carga del ingress"
}