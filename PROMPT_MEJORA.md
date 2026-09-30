# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener un ZIP con el proyecto completo y arrancable.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `microservices/auth-service/templates/deployment.yaml` — El topic pide contenedores/orquestacion: este archivo es el ejercicio, no scaffolding.
- `microservices/user-service/templates/deployment.yaml` — El topic pide contenedores/orquestacion: este archivo es el ejercicio, no scaffolding.
- `microservices/payment-service/templates/deployment.yaml` — El topic pide contenedores/orquestacion: este archivo es el ejercicio, no scaffolding.

## Lo que le falta a este proyecto

Esto NO lo tenes que adivinar: salio de comparar el proyecto contra la arquitectura declarada del reto y de un analisis estatico del codigo. Completalo TODO.

### Archivos que la arquitectura del reto declara y no estan

Creálos con implementacion real, en la capa que les corresponde:

- `microservices/user-service/values.yaml`

## Como saber que terminaste

```bash
docker build -t reto:local . && terraform -chdir=terraform init -backend=false && terraform -chdir=terraform validate
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Contexto técnico original
Diseñar y desplegar una plataforma de microservicios con Kubernetes, Helm, GitOps con ArgoCD y monitoreo con Prometheus y Grafana

### Reto
- Tema: Kubernetes DevOps
- Seniority: advanced-l2
- Tipo: practical
- Título: Despliegue de plataforma de microservicios con Kubernetes
- Tiempo estimado: 20 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Configuración inicial de Kubernetes — objetivo: Configurar un cluster de Kubernetes funcional con alta disponibilidad. — entregable (NO resolver): Cluster de Kubernetes configurado y documentado.
- Fase 2: Despliegue de microservicios con Helm — objetivo: Desplegar los microservicios de autenticación, usuarios y pagos utilizando Helm. — entregable (NO resolver): Microservicios desplegados y documentados utilizando Helm.
- Fase 3: Implementación de GitOps con ArgoCD — objetivo: Configurar ArgoCD para gestionar el despliegue de los microservicios. — entregable (NO resolver): Configuración de ArgoCD para gestionar el despliegue de microservicios.
- Fase 4: Configuración de monitoreo con Prometheus y Grafana — objetivo: Configurar Prometheus y Grafana para monitorear los microservicios. — entregable (NO resolver): Configuración de Prometheus y Grafana para monitorear los microservicios.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (ZIP).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Exportación en ZIP
Empaqueta todos los archivos en un único archivo ZIP descargable respetando exactamente
la estructura de rutas indicada por los marcadores.
El ZIP debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: El ZIP debe estar listo para descargar al finalizar. No preguntes si el usuario
quiere generarlo. Simplemente genera el archivo y proporciona el enlace de descarga; No debes desplegar en el chat el resumen de lo que arreglaste al Zip, solo entregalo.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del enlace de descarga del ZIP
No preguntes si el usuario quiere el ZIP: simplemente generalo siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: providers.tf ===
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

// === ARCHIVO: variables.tf ===
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

// === ARCHIVO: argocd/application.yaml ===
# Configuración de ArgoCD para sincronizar los repositorios con el cluster
# Este archivo define las aplicaciones que ArgoCD gestionará para el despliegue de los microservicios.

apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: auth-service
  namespace: argocd
spec:
  project: default
  source:
    repoURL: https://github.com/empresa/microservices-charts.git
    targetRevision: HEAD
    path: auth-service
    helm:
      releaseName: auth-service
      valueFiles:
        - values.yaml
  destination:
    server: https://kubernetes.default.svc
    namespace: microservices
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
      - CreateNamespace=true

---
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: user-service
  namespace: argocd
spec:
  project: default
  source:
    repoURL: https://github.com/empresa/microservices-charts.git
    targetRevision: HEAD
    path: user-service
    helm:
      releaseName: user-service
      valueFiles:
        - values.yaml
  destination:
    server: https://kubernetes.default.svc
    namespace: microservices
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
      - CreateNamespace=true

---
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: payment-service
  namespace: argocd
spec:
  project: default
  source:
    repoURL: https://github.com/empresa/microservices-charts.git
    targetRevision: HEAD
    path: payment-service
    helm:
      releaseName: payment-service
      valueFiles:
        - values.yaml
  destination:
    server: https://kubernetes.default.svc
    namespace: microservices
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
      - CreateNamespace=true

---
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: monitoring
  namespace: argocd
spec:
  project: default
  source:
    repoURL: https://github.com/empresa/monitoring-charts.git
    targetRevision: HEAD
    path: prometheus
    helm:
      releaseName: prometheus
      valueFiles:
        - values.yaml
  destination:
    server: https://kubernetes.default.svc
    namespace: monitoring
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
      - CreateNamespace=true

---
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: grafana
  namespace: argocd
spec:
  project: default
  source:
    repoURL: https://github.com/empresa/monitoring-charts.git
    targetRevision: HEAD
    path: grafana
    helm:
      releaseName: grafana
      valueFiles:
        - values.yaml
  destination:
    server: https://kubernetes.default.svc
    namespace: monitoring
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
      - CreateNamespace=true"


// === ARCHIVO: main.tf ===
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

// === ARCHIVO: README.md ===
# Plataforma de Microservicios con Kubernetes

Este proyecto proporciona la infraestructura completa para desplegar una plataforma de microservicios en Kubernetes, utilizando GitOps con ArgoCD y monitoreo con Prometheus y Grafana.

## Arquitectura General

La plataforma está diseñada para manejar 10,000 solicitudes por segundo con un tiempo de respuesta promedio de 200ms. Incluye tres microservicios principales:

- **Auth Service**: Servicio de autenticación y autorización
- **User Service**: Gestión de usuarios y perfiles
- **Payment Service**: Procesamiento de pagos

## Componentes de la Plataforma

### Niveles de Infraestructura

| Componente | Versión | Propósito |
|------------|---------|----------|
| Kubernetes | 1.28 | Orquestación de contenedores |
| Helm | 3.13 | Gestión de paquetes Kubernetes |
| ArgoCD | 2.9.3 | GitOps para despliegues |
| Prometheus | 2.47.0 | Recolección de métricas |
| Grafana | 10.2.0 | Visualización de métricas |
| Ingress NGINX | 4.8.0 | Gestión de tráfico entrante |
| cert-manager | 1.13.0 | Gestión de certificados TLS |

### Estructura de Namespaces

- `microservices-platform`: Contiene los tres microservicios
- `monitoring`: Prometheus, Grafana y componentes de observabilidad
- `argocd`: Sistema ArgoCD para GitOps
- `ingress-nginx`: Controlador de ingress
- `cert-manager`: Gestión de certificados

## Requisitos Previos

- Terraform >= 1.5.0
- kubectl instalado y configurado
- Acceso a un cluster de Kubernetes (EKS, GKE, AKS o local)
- Credenciales de Docker Registry (si se usan imágenes privadas)
- Certificado TLS y clave privada (para HTTPS)

## Configuración Inicial

### 1. Configurar Variables de Terraform

Crear un archivo `terraform.tfvars` con los valores apropiados:

```hcl
cluster_name         = "microservices-prod"
environment          = "production"
aws_region           = "us-east-1"
kubeconfig_path      = "~/.kube/config"
cluster_context      = "production"

# Configuración de nodos
node_count           = 3
instance_type        = "t3.large"

# Configuración de ArgoCD
argocd_hostname      = "argocd.plataforma.ejemplo.com"
argocd_controller_replicas = 2
argocd_server_replicas     = 2
argocd_repo_server_replicas = 2

# Configuración de Grafana
grafana_hostname     = "grafana.plataforma.ejemplo.com"
grafana_admin_user   = "admin"
grafana_admin_password = "changeme"

# Configuración de monitoreo
alertmanager_replicas = 2

# Configuración de Ingress
ingress_replicas     = 2

# Configuración de cert-manager
cert_manager_replicas = 2
letsencrypt_email   = "admin@plataforma.ejemplo.com"

# Secretos (base64 encoded)
docker_config_json   = "<docker-config-json-base64>"
tls_certificate      = "<tls-cert-base64>"
tls_private_key      = "<tls-key-base64>"
```

### 2. Inicializar Terraform

```bash
terraform init
```

### 3. Planificar la Infraestructura

```bash
terraform plan -out=tfplan
```

### 4. Aplicar la Configuración

```bash
terraform apply tfplan
```

## Estructura del Proyecto

```
.
├── main.tf                    # Recursos principales de Terraform
├── providers.tf               # Configuración de proveedores
├── variables.tf               # Definición de variables
├── outputs.tf                 # Outputs de Terraform
├── values/                    # Valores específicos para Helm
│   ├── argocd-values.yaml
│   ├── prometheus-values.yaml
│   └── grafana-values.yaml
├── cluster/                   # Configuración del cluster
│   ├── nodes-config.yaml
│   └── loadbalancer.yaml
├── microservices/             # Charts de Helm para microservicios
│   ├── auth-service/
│   ├── user-service/
│   └── payment-service/
├── argocd/                    # Configuración de ArgoCD
│   ├── application.yaml
│   └── argocd-cm.yaml
└── monitoring/                # Configuración de monitoreo
    ├── prometheus/
    └── grafana/
```

## Acceso a los Componentes

### ArgoCD

Después del despliegue, ArgoCD estará disponible en:

```
URL: https://argocd.plataforma.ejemplo.com
Usuario: admin
Password: obtener con: kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

### Grafana

```
URL: https://grafana.plataforma.ejemplo.com
Usuario: admin (configurable)
Password: definido en variables
```

### Prometheus

```
URL: http://prometheus-server.monitoring.svc.cluster.local:9090
```

## Configuración de GitOps

### Aplicación ArgoCD

La aplicación ArgoCD está configurada para sincronizar automáticamente los microservicios desde el repositorio Git. Los archivos de configuración se encuentran en:

- `argocd/application.yaml`: Define la aplicación principal
- `argocd/argocd-cm.yaml`: Configuración adicional de ArgoCD

### Sincronización Manual

```bash
kubectl apply -f argocd/application.yaml
```

### Sincronización desde ArgoCD UI

1. Acceder a ArgoCD
2. Seleccionar la aplicación
3. Click en "Sync" para sincronizar cambios

## Monitoreo y Observabilidad

### Métricas Disponibles

- **Métricas de Kubernetes**: Uso de CPU, memoria, red, disco
- **Métricas de Aplicación**: Latencia, throughput, errores
- **Métricas Personalizadas**: Definidas en cada microservicio

### Dashboards de Grafana

Los dashboards están preconfigurados en:

- `monitoring/grafana/dashboards.yaml`: Definición de dashboards
- `monitoring/grafana/grafana-config.yaml`: Configuración de Grafana

### Alertas Configuradas

- Alertas de Prometheus en `monitoring/prometheus/prometheus-config.yaml`
- Service monitors en `monitoring/prometheus/service-monitor.yaml`

## Escalabilidad y Alta Disponibilidad

### Horizontal Pod Autoscaler

Cada microservicio está configurado con HPA para escalar automáticamente:

- Mínimo de réplicas: 2
- Máximo de réplicas: 10
- Target CPU: 70%
- Target Memory: 80%

### Resource Quotas y Limits

- Resource Quota en el namespace `microservices-platform`
- LimitRange para valores mínimos y máximos por pod

### Network Policies

Políticas de red configuradas para restringir tráfico entre pods.

## Seguridad

### TLS/SSL

- Certificados gestionados por cert-manager
- Issuers configurados para Let's Encrypt (staging y production)
- Renovación automática de certificados

### Secretos

- Credenciales almacenadas en Kubernetes Secrets
- Docker registry secret para imágenes privadas
- TLS certificates como secretos

### Network Policies

- Tráfico restringido entre namespaces
- Solo tráfico necesario permitido
- Aislamiento de pods de microservicios

## Mantenimiento

### Actualización de Microservicios

1. Modificar el archivo `values.yaml` del servicio correspondiente
2. Commit y push a Git
3. ArgoCD detectará el cambio y sync automáticamente

### Escalado Manual

```bash
kubectl scale deployment auth-service --replicas=5 -n microservices-platform
```

### Verificación de Estado

```bash
# Ver pods
kubectl get pods -n microservices-platform

# Ver servicios
kubectl get svc -n microservices-platform

# Ver eventos
kubectl get events -n microservices-platform --sort-by='.lastTimestamp'
```

## Troubleshooting

### Problemas Comunes

1. **Pods no inician**: Verificar logs con `kubectl describe pod <nombre> -n microservices-platform`
2. **Service no accesible**: Verificar endpoints con `kubectl get endpoints -n microservices-platform`
3. **ArgoCD fuera de sync**: Ver diferencias con `argocd app diff <app-name>`
4. **Métricas no aparecen**: Verificar ServiceMonitor y configuración de Prometheus

### Logs

```bash
# Logs de un pod específico
kubectl logs -f <pod-name> -n microservices-platform

# Logs anteriores (si el pod reinició)
kubectl logs --previous <pod-name> -n microservices-platform

# Logs de todos los pods de un servicio
kubectl logs -l app=auth-service -n microservices-platform
```

## Limpieza

Para destruir toda la infraestructura:

```bash
terraform destroy
```

**Advertencia**: Esto eliminará todos los recursos creados, incluyendo datosPersistidos en PersistentVolumeClaims.

## Contribuir

1. Fork del repositorio
2. Crear rama feature: `git checkout -b feature/nueva-caracteristica`
3. Commit de cambios: `git commit -m 'Añadir nueva característica'`
4. Push a la rama: `git push origin feature/nueva-caracteristica`
5. Crear Pull Request

## Licencia

Este proyecto está bajo la licencia MIT. Ver archivo LICENSE para más detalles.


// === ARCHIVO: cluster/nodes-config.yaml ===
apiVersion: v1
kind: Namespace
metadata:
  name: platform
  labels:
    name: platform
    environment: production
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: cluster-config
  namespace: platform
data:
  cluster-name: "microservices-platform"
  region: "us-east-1"
  availability-zones: "us-east-1a,us-east-1b,us-east-1c"
  node-pool-default: "general-purpose"
---
apiVersion: v1
kind: Secret
metadata:
  name: cluster-secrets
  namespace: platform
type: Opaque
stringData:
  aws-access-key: "${AWS_ACCESS_KEY_ID}"
  aws-secret-key: "${AWS_SECRET_ACCESS_KEY}"
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: cluster-admin
  namespace: platform
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: cluster-admin-binding
subjects:
  - kind: ServiceAccount
    name: cluster-admin
    namespace: platform
roleRef:
  kind: ClusterRole
  name: cluster-admin
  apiGroup: rbac.authorization.k8s.io
---
apiVersion: v1
kind: LimitRange
metadata:
  name: resource-limits
  namespace: platform
spec:
  limits:
    - default:
        cpu: "2"
        memory: "4Gi"
      defaultRequest:
        cpu: "500m"
        memory: "1Gi"
      type: Container
    - max:
        cpu: "8"
        memory: "16Gi"
      min:
        cpu: "100m"
        memory: "256Mi"
      type: Pod
---
apiVersion: v1
kind: ResourceQuota
metadata:
  name: compute-quota
  namespace: platform
spec:
  hard:
    requests.cpu: "32"
    requests.memory: "64Gi"
    limits.cpu: "64"
    limits.memory: "128Gi"
    pods: "100"
    services: "50"
    configmaps: "20"
    secrets: "20"
---
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: platform-hpa
  namespace: platform
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: placeholder
  minReplicas: 3
  maxReplicas: 20
  metrics:
    - type: Resource
      resource:
        name: cpu
        target:
          type: Utilization
          averageUtilization: 70
    - type: Resource
      resource:
        name: memory
        target:
          type: Utilization
          averageUtilization: 80
  behavior:
    scaleDown:
      stabilizationWindowSeconds: 300
      policies:
        - type: Percent
          value: 10
          periodSeconds: 60
    scaleUp:
      stabilizationWindowSeconds: 0
      policies:
        - type: Percent
          value: 100
          periodSeconds: 15
        - type: Pods
          value: 4
          periodSeconds: 15
      selectPolicy: Max
---
apiVersion: v1
kind: PodDisruptionBudget
metadata:
  name: platform-pdb
  namespace: platform
spec:
  minAvailable: 2
  selector:
    matchLabels:
      app.kubernetes.io/part-of: platform
---
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: platform-network-policy
  namespace: platform
spec:
  podSelector:
    matchLabels:
      app.kubernetes.io/part-of: platform
  policyTypes:
    - Ingress
    - Egress
  ingress:
    - from:
        - namespaceSelector:
            matchLabels:
              name: platform
        - namespaceSelector:
            matchLabels:
              name: monitoring
        - podSelector:
            matchLabels:
              app.kubernetes.io/name: ingress-nginx
      ports:
        - protocol: TCP
          port: 8080
        - protocol: TCP
          port: 8443
  egress:
    - to:
        - namespaceSelector:
            matchLabels:
              name: kube-system
      ports:
        - protocol: TCP
          port: 53
        - protocol: UDP
          port: 53
    - to:
        - podSelector:
            matchLabels:
              app.kubernetes.io/part-of: platform
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: node-labels
  namespace: platform
data:
  node-selector.yaml: |
    node-pools:
      general-purpose:
        labels:
          node.kubernetes.io/pool: general
        taints: []
      memory-intensive:
        labels:
          node.kubernetes.io/pool: memory
        taints:
          - key: workload
            value: memory-intensive
            effect: NoSchedule
      compute-intensive:
        labels:
          node.kubernetes.io/pool: compute
        taints:
          - key: workload
            value: compute-intensive
            effect: NoSchedule
---
apiVersion: v1
kind: Service
metadata:
  name: platform-internal
  namespace: platform
  annotations:
    service.beta.kubernetes.io/aws-load-balancer-internal: "true"
spec:
  type: ClusterIP
  selector:
    app.kubernetes.io/part-of: platform
  ports:
    - name: http
      port: 80
      targetPort: 8080
    - name: https
      port: 443
      targetPort: 8443
---
apiVersion: v1
kind: Endpoints
metadata:
  name: platform-service
  namespace: platform
subsets: []

// === ARCHIVO: cluster/loadbalancer.yaml ===
apiVersion: v1
kind: Namespace
metadata:
  name: ingress-nginx
  labels:
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/instance: ingress-nginx
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: ingress-nginx
  namespace: ingress-nginx
  labels:
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/instance: ingress-nginx
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: ingress-nginx
  labels:
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/instance: ingress-nginx
rules:
  - apiGroups: [""]
    resources: ["configmaps", "endpoints", "nodes", "pods", "secrets", "namespaces"]
    verbs: ["list", "watch"]
  - apiGroups: [""]
    resources: ["nodes"]
    verbs: ["get"]
  - apiGroups: [""]
    resources: ["services"]
    verbs: ["get", "list", "watch"]
  - apiGroups: ["networking.k8s.io"]
    resources: ["ingresses", "ingressclasses"]
    verbs: ["get", "list", "watch"]
  - apiGroups: ["networking.k8s.io"]
    resources: ["ingresses/status"]
    verbs: ["update"]
  - apiGroups: [""]
    resources: ["configmaps"]
    verbs: ["get", "update", "create"]
  - apiGroups: [""]
    resources: ["events"]
    verbs: ["create", "patch"]
  - apiGroups: ["coordination.k8s.io"]
    resources: ["leases"]
    verbs: ["get", "create", "update"]
  - apiGroups: ["discovery.k8s.io"]
    resources: ["endpointslices"]
    verbs: ["list", "watch", "get"]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: ingress-nginx
  labels:
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/instance: ingress-nginx
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: ingress-nginx
subjects:
  - kind: ServiceAccount
    name: ingress-nginx
    namespace: ingress-nginx
---
apiVersion: networking.k8s.io/v1
kind: IngressClass
metadata:
  name: nginx
  labels:
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/instance: ingress-nginx
  annotations:
    ingressclass.kubernetes.io/is-default-class: "true"
spec:
  controller: k8s.io/ingress-nginx
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: ingress-nginx-controller
  namespace: ingress-nginx
  labels:
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/component: controller
    app.kubernetes.io/instance: ingress-nginx
data:
  allow-snippet-annotations: "false"
  use-forwarded-headers: "true"
  compute-full-forwarded-for: "true"
  use-proxy-protocol: "false"
  enable-underscores-in-headers: "true"
  large-client-header-buffers: "4 16k"
  client-header-buffer-size: "4k"
  keep-alive: "75"
  keep-alive-requests: "1000"
  max-worker-connections: "65536"
  worker-processes: "auto"
  proxy-body-size: "50m"
  proxy-connect-timeout: "10"
  proxy-read-timeout: "60"
  proxy-send-timeout: "60"
  ssl-protocols: "TLSv1.2 TLSv1.3"
  ssl-ciphers: "ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256"
  proxy-buffer-size: "16k"
  proxy-buffers-number: "8"
  proxy-buffers-size: "16k"
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ingress-nginx-controller
  namespace: ingress-nginx
  labels:
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/component: controller
    app.kubernetes.io/instance: ingress-nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app.kubernetes.io/name: ingress-nginx
      app.kubernetes.io/component: controller
      app.kubernetes.io/instance: ingress-nginx
  template:
    metadata:
      labels:
        app.kubernetes.io/name: ingress-nginx
        app.kubernetes.io/component: controller
        app.kubernetes.io/instance: ingress-nginx
    spec:
      serviceAccountName: ingress-nginx
      terminationGracePeriodSeconds: 300
      containers:
        - name: controller
          image: registry.k8s.io/ingress-nginx/controller:v1.9.4
          args:
            - /nginx-ingress-controller
            - --publish-service=$(POD_NAMESPACE)/ingress-nginx-controller
            - --election-id=ingress-nginx-leader
            - --controller-class=k8s.io/ingress-nginx
            - --ingress-class=nginx
            - --configmap=$(POD_NAMESPACE)/ingress-nginx-controller
            - --watch-ingress-without-class=true
          securityContext:
            capabilities:
              drop:
                - ALL
              add:
                - NET_BIND_SERVICE
            runAsUser: 101
            allowPrivilegeEscalation: true
          env:
            - name: POD_NAME
              valueFrom:
                fieldRef:
                  fieldPath: metadata.name
            - name: POD_NAMESPACE
              valueFrom:
                fieldRef:
                  fieldPath: metadata.namespace
            - name: LD_PRELOAD
              value: /usr/local/lib/libmimalloc.so
          ports:
            - name: http
              containerPort: 80
              protocol: TCP
            - name: https
              containerPort: 443
              protocol: TCP
            - name: webhook
              containerPort: 8443
              protocol: TCP
          livenessProbe:
            httpGet:
              path: /healthz
              port: 10254
              scheme: HTTP
            initialDelaySeconds: 10
            periodSeconds: 10
            timeoutSeconds: 1
            successThreshold: 1
            failureThreshold: 5
          readinessProbe:
            httpGet:
              path: /healthz
              port: 10254
              scheme: HTTP
            initialDelaySeconds: 10
            periodSeconds: 10
            timeoutSeconds: 1
            successThreshold: 1
            failureThreshold: 3
          resources:
            requests:
              cpu: "100m"
              memory: "256Mi"
            limits:
              cpu: "500m"
              memory: "512Mi"
---
apiVersion: v1
kind: Service
metadata:
  name: ingress-nginx-controller
  namespace: ingress-nginx
  labels:
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/component: controller
    app.kubernetes.io/instance: ingress-nginx
  annotations:
    service.beta.kubernetes.io/aws-load-balancer-type: "nlb"
    service.beta.kubernetes.io/aws-load-balancer-backend-protocol: "tcp"
    service.beta.kubernetes.io/aws-load-balancer-ssl-cert: "arn:aws:acm:us-east-1:123456789012:certificate/cert-id"
    service.beta.kubernetes.io/aws-load-balancer-ssl-ports: "443"
    service.beta.kubernetes.io/aws-load-balancer-cross-zone-load-balancing-enabled: "true"
spec:
  type: LoadBalancer
  externalTrafficPolicy: Local
  ports:
    - name: http
      port: 80
      targetPort: http
      protocol: TCP
    - name: https
      port: 443
      targetPort: https
      protocol: TCP
  selector:
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/component: controller
    app.kubernetes.io/instance: ingress-nginx
---
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: ingress-nginx-controller
  namespace: ingress-nginx
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: ingress-nginx-controller
  minReplicas: 3
  maxReplicas: 10
  metrics:
    - type: Resource
      resource:
        name: cpu
        target:
          type: Utilization
          averageUtilization: 60
    - type: Resource
      resource:
        name: memory
        target:
          type: Utilization
          averageUtilization: 70
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: platform-ingress
  namespace: platform
  annotations:
    nginx.ingress.kubernetes.io/ssl-redirect: "true"
    nginx.ingress.kubernetes.io/proxy-body-size: "50m"
    nginx.ingress.kubernetes.io/proxy-connect-timeout: "10"
    nginx.ingress.kubernetes.io/proxy-read-timeout: "60"
    nginx.ingress.kubernetes.io/proxy-send-timeout: "60"
    nginx.ingress.kubernetes.io/proxy-buffer-size: "16k"
    nginx.ingress.kubernetes.io/enable-underscores-in-headers: "true"
    nginx.ingress.kubernetes.io/proxy-next-upstream: "error timeout invalid_header http_500 http_502 http_503 http_504"
    nginx.ingress.kubernetes.io/proxy-next-upstream-tries: "3"
    nginx.ingress.kubernetes.io/proxy-next-upstream-timeout: "10"
    cert-manager.io/cluster-issuer: "letsencrypt-prod"
    kubernetes.io/ingress.class: nginx
spec:
  tls:
    - hosts:
        - api.platform.example.com
        - auth.platform.example.com
        - payment.platform.example.com
      secretName: platform-tls
  rules:
    - host: api.platform.example.com
      http:
        paths:
          - path: /api/users
            pathType: Prefix
            backend:
              service:
                name: user-service
                port:
                  number: 80
          - path: /api/payments
            pathType: Prefix
            backend:
              service:
                name: payment-service
                port:
                  number: 80
    - host: auth.platform.example.com
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: auth-service
                port:
                  number: 80
---
apiVersion: v1
kind: Service
metadata:
  name: ingress-nginx-controller-metrics
  namespace: ingress-nginx
  labels:
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/component: controller
spec:
  clusterIP: None
  ports:
    - name: metrics
      port: 10254
      targetPort: 10254
      protocol: TCP
  selector:
    app.kubernetes.io/name: ingress-nginx
    app.kubernetes.io/component: controller


// === ARCHIVO: microservices/auth-service/Chart.yaml ===
apiVersion: v2
name: auth-service
description: Helm chart para el servicio de autenticación de la plataforma de microservicios
type: application
version: 1.0.0
appVersion: "1.0.0"
keywords:
  - auth-service
  - autenticacion
  - microservicio
  - kubernetes
  - plataforma
maintainers:
  - name: Equipo DevOps
    email: devops@empresa.com
dependencies: []

// === ARCHIVO: microservices/auth-service/values.yaml ===
replicaCount: 3

image:
  repository: empresa/auth-service
  pullPolicy: IfNotPresent
  tag: "1.0.0"

imagePullSecrets: []
nameOverride: ""
fullnameOverride: ""

serviceAccount:
  create: true
  annotations: {}
  name: ""

podAnnotations:
  prometheus.io/scrape: "true"
  prometheus.io/port: "8080"
  prometheus.io/path: "/metrics"

podSecurityContext:
  runAsNonRoot: true
  runAsUser: 1000
  fsGroup: 1000

securityContext:
  capabilities:
    drop:
      - ALL
  readOnlyRootFilesystem: true
  allowPrivilegeEscalation: false

service:
  type: ClusterIP
  port: 8080
  targetPort: 8080
  annotations:
    prometheus.io/scrape: "true"
    prometheus.io/port: "8080"

ingress:
  enabled: true
  className: "nginx"
  annotations:
    cert-manager.io/cluster-issuer: "letsencrypt-prod"
    nginx.ingress.kubernetes.io/ssl-redirect: "true"
    nginx.ingress.kubernetes.io/force-ssl-redirect: "true"
    nginx.ingress.kubernetes.io/proxy-body-size: "10m"
  hosts:
    - host: auth.plataforma.empresa.com
      paths:
        - path: /
          pathType: Prefix
  tls:
    - secretName: auth-service-tls
      hosts:
        - auth.plataforma.empresa.com

resources:
  limits:
    cpu: 2000m
    memory: 2Gi
  requests:
    cpu: 500m
    memory: 512Mi

readinessProbe:
  httpGet:
    path: /health/ready
    port: 8080
  initialDelaySeconds: 10
  periodSeconds: 10
  timeoutSeconds: 5
  successThreshold: 1
  failureThreshold: 3

livenessProbe:
  httpGet:
    path: /health/live
    port: 8080
  initialDelaySeconds: 30
  periodSeconds: 15
  timeoutSeconds: 5
  failureThreshold: 5

startupProbe:
  httpGet:
    path: /health/ready
    port: 8080
  initialDelaySeconds: 0
  periodSeconds: 5
  timeoutSeconds: 3
  failureThreshold: 30

autoscaling:
  enabled: true
  minReplicas: 3
  maxReplicas: 20
  targetCPUUtilizationPercentage: 70
  targetMemoryUtilizationPercentage: 80

nodeSelector: {}

tolerations: []

affinity:
  podAntiAffinity:
    preferredDuringSchedulingIgnoredDuringExecution:
      - weight: 100
        podAffinityTerm:
          labelSelector:
            matchLabels:
              app: auth-service
          topologyKey: kubernetes.io/hostname
  podDisruptionBudget:
    minAvailable: 2

configMaps:
  application.yml: |-
    server:
      port: 8080
    
    jwt:
      secret: ${JWT_SECRET}
      expiration: 3600000
    
    database:
      host: ${DB_HOST}
      port: 5432
      name: ${DB_NAME}
      username: ${DB_USERNAME}
      password: ${DB_PASSWORD}
      pool:
        min: 5
        max: 20
    
    redis:
      host: ${REDIS_HOST}
      port: 6379
      password: ${REDIS_PASSWORD}
      database: 0
    
    logging:
      level: INFO
      format: json
    
    metrics:
      enabled: true
      export:
        prometheus:
          enabled: true
          path: /metrics

secrets:
  jwtSecret: ""
  dbPassword: ""
  redisPassword: ""

env:
  - name: JWT_SECRET
    valueFrom:
      secretKeyRef:
        name: auth-service-secrets
        key: jwt-secret
  - name: DB_HOST
    valueFrom:
      configMapKeyRef:
        name: auth-service-config
        key: db-host
  - name: DB_USERNAME
    value: "authuser"
  - name: REDIS_HOST
    valueFrom:
      configMapKeyRef:
        name: auth-service-config
        key: redis-host

persistence:
  enabled: false

networkPolicy:
  enabled: true
  egress:
    - to:
        - podSelector:
            matchLabels:
              k8s-app: kube-dns
      ports:
        - protocol: UDP
          port: 53
    - to:
        - podSelector:
            matchLabels:
              app: postgres
      ports:
        - protocol: TCP
          port: 5432
    - to:
        - podSelector:
            matchLabels:
              app: redis
      ports:
        - protocol: TCP
          port: 6379

// === ARCHIVO: microservices/auth-service/templates/deployment.yaml ===
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ include "auth-service.fullname" . }}
  labels:
    {{- include "auth-service.labels" . | nindent 4 }}
spec:
  replicas: {{ .Values.replicaCount }}
  selector:
    matchLabels:
      {{- include "auth-service.selectorLabels" . | nindent 6 }}
  template:
    metadata:
      annotations:
        checksum/config: {{ include (print $.Template.BasePath "/configmap.yaml") . | sha256sum }}
        {{- with .Values.podAnnotations }}
        {{- toYaml . | nindent 8 }}
        {{- end }}
      labels:
        {{- include "auth-service.selectorLabels" . | nindent 8 }}
    spec:
      serviceAccountName: {{ include "auth-service.serviceAccountName" . }}
      securityContext:
        {{- toYaml .Values.podSecurityContext | nindent 8 }}
      containers:
        - name: {{ .Chart.Name }}
          securityContext:
            {{- toYaml .Values.securityContext | nindent 12 }}
          image: "{{ .Values.image.repository }}:{{ .Values.image.tag | default .Chart.AppVersion }}"
          imagePullPolicy: {{ .Values.image.pullPolicy }}
          ports:
            - name: http
              containerPort: {{ .Values.service.targetPort }}
              protocol: TCP
          env:
            {{- toYaml .Values.env | nindent 12 }}
          livenessProbe:
            {{- toYaml .Values.livenessProbe | nindent 12 }}
          readinessProbe:
            {{- toYaml .Values.readinessProbe | nindent 12 }}
          startupProbe:
            {{- toYaml .Values.startupProbe | nindent 12 }}
          resources:
            {{- toYaml .Values.resources | nindent 12 }}
          volumeMounts:
            - name: tmp
              mountPath: /tmp
            - name: cache
              mountPath: /app/cache
      volumes:
        - name: tmp
          emptyDir: {}
        - name: cache
          emptyDir: {}
      {{- with .Values.nodeSelector }}
      nodeSelector:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with .Values.affinity }}
      affinity:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with .Values.tolerations }}
      tolerations:
        {{- toYaml . | nindent 8 }}
      {{- end }}


// === ARCHIVO: microservices/auth-service/templates/service.yaml ===
apiVersion: v1
kind: Service
metadata:
  name: {{ include "auth-service.fullname" . }}
  labels:
    {{- include "auth-service.labels" . | nindent 4 }}
    app.kubernetes.io/component: service
  annotations:
    description: "Servicio de autenticación para la plataforma de microservicios"
    {{- if .Values.service.annotations }}
    {{- toYaml .Values.service.annotations | nindent 4 }}
    {{- end }}
spec:
  type: {{ .Values.service.type }}
  {{- if (eq .Values.service.type "ClusterIP") }}
  clusterIP: {{ .Values.service.clusterIP | default "" }}
  {{- end }}
  {{- if (eq .Values.service.type "LoadBalancer") }}
  loadBalancerIP: {{ .Values.service.loadBalancerIP | default "" }}
  {{- if .Values.service.loadBalancerSourceRanges }}
  loadBalancerSourceRanges:
    {{- toYaml .Values.service.loadBalancerSourceRanges | nindent 4 }}
  {{- end }}
  {{- end }}
  ports:
    - name: http
      port: {{ .Values.service.ports.http }}
      targetPort: {{ .Values.service.targetPorts.http }}
      protocol: TCP
      {{- if (and (eq .Values.service.type "NodePort") .Values.service.nodePorts.http) }}
      nodePort: {{ .Values.service.nodePorts.http }}
      {{- end }}
    {{- if .Values.service.ports.https }}
    - name: https
      port: {{ .Values.service.ports.https }}
      targetPort: {{ .Values.service.targetPorts.https }}
      protocol: TCP
      {{- if (and (eq .Values.service.type "NodePort") .Values.service.nodePorts.https) }}
      nodePort: {{ .Values.service.nodePorts.https }}
      {{- end }}
    {{- end }}
    {{- if .Values.service.ports.metrics }}
    - name: metrics
      port: {{ .Values.service.ports.metrics }}
      targetPort: {{ .Values.service.targetPorts.metrics }}
      protocol: TCP
    {{- end }}
  selector:
    {{- include "auth-service.selectorLabels" . | nindent 4 }}
  {{- if .Values.service.externalTrafficPolicy }}
  externalTrafficPolicy: {{ .Values.service.externalTrafficPolicy }}
  {{- end }}
  {{- if .Values.service.sessionAffinity }}
  sessionAffinity: {{ .Values.service.sessionAffinity }}
  {{- end }}
  {{- if .Values.service.healthCheckNodePort }}
  healthCheckNodePort: {{ .Values.service.healthCheckNodePort }}
  {{- end }}
---
# Configuración de endpoints para service mesh si está habilitado
{{- if .Values.service.mesh.enabled }}
apiVersion: v1
kind: Service
metadata:
  name: {{ include "auth-service.fullname" . }}-mesh
  labels:
    {{- include "auth-service.labels" . | nindent 4 }}
    app.kubernetes.io/component: service-mesh
  annotations:
    service.kubernetes.io/backend-protocol: "GRPC"
    {{- if eq .Values.service.mesh.provider "istio" }}
    traffic.sidecar.istio.io/includeOutboundPorts: "{{ .Values.service.ports.http }}"
    {{- end }}
spec:
  type: ClusterIP
  ports:
    - name: grpc
      port: {{ .Values.service.ports.grpc }}
      targetPort: {{ .Values.service.targetPorts.grpc }}
      protocol: TCP
  selector:
    {{- include "auth-service.selectorLabels" . | nindent 4 }}
{{- end }}

// === ARCHIVO: microservices/user-service/Chart.yaml ===
apiVersion: v2
name: user-service
description: |
  Chart de Helm para el servicio de usuarios de la plataforma de microservicios.
  Este servicio gestiona las operaciones CRUD de usuarios, perfil y preferencias.
  Implementa alta disponibilidad con soporte para escalamiento horizontal automático.
type: application
version: 1.0.0
appVersion: "1.0.0"
keywords:
  - microservicio
  - usuarios
  - kubernetes
  - helm
  - plataforma
home: https://plataforma-microservicios.example.com
sources:
  - https://github.com/organization/plataforma-microservicios
maintainers:
  - name: Equipo DevOps
    email: devops@empresa.com
    url: https://devops.empresa.com
dependencies:
  - name: common
    version: "1.18.0"
    repository: "https://charts.bitnami.com/bitnami"
  - name: postgresql
    version: "12.12.10"
    repository: "https://charts.bitnami.com/bitnami"
    condition: postgresql.enabled
    alias: database
annotations:
  category: Application
  licenses: Apache-2.0
  tags:
    - plataforma
    - microservicio
    - usuarios
    - kubernetes
    - gitops


// === ARCHIVO: microservices/user-service/templates/deployment.yaml ===
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ .Release.Name }}-user-service
  namespace: {{ .Values.namespace }}
  labels:
    app: user-service
    version: {{ .Chart.Version }}
    {{- include "user-service.labels" . | nindent 4 }}
spec:
  replicas: {{ .Values.replicas }}
  selector:
    matchLabels:
      app: user-service
  template:
    metadata:
      labels:
        app: user-service
        version: {{ .Values.image.tag }}
    spec:
      serviceAccountName: {{ .Values.serviceAccountName }}
      containers:
        - name: user-service
          image: "{{ .Values.image.repository }}:{{ .Values.image.tag }}"
          imagePullPolicy: {{ .Values.image.pullPolicy }}
          ports:
            - name: http
              containerPort: {{ .Values.service.port }}
              protocol: TCP
          env:
            {{- toYaml .Values.env | nindent 12 }}
          resources:
            requests:
              memory: "{{ .Values.resources.requests.memory }}"
              cpu: "{{ .Values.resources.requests.cpu }}"
            limits:
              memory: "{{ .Values.resources.limits.memory }}"
              cpu: "{{ .Values.resources.limits.cpu }}"
          livenessProbe:
            httpGet:
              path: {{ .Values.livenessProbe.path }}
              port: http
            initialDelaySeconds: {{ .Values.livenessProbe.initialDelaySeconds }}
            periodSeconds: {{ .Values.livenessProbe.periodSeconds }}
            timeoutSeconds: {{ .Values.livenessProbe.timeoutSeconds }}
            failureThreshold: {{ .Values.livenessProbe.failureThreshold }}
          readinessProbe:
            httpGet:
              path: {{ .Values.readinessProbe.path }}
              port: http
            initialDelaySeconds: {{ .Values.readinessProbe.initialDelaySeconds }}
            periodSeconds: {{ .Values.readinessProbe.periodSeconds }}
            timeoutSeconds: {{ .Values.readinessProbe.timeoutSeconds }}
            failureThreshold: {{ .Values.readinessProbe.failureThreshold }}
      {{- with .Values.nodeSelector }}
      nodeSelector:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with .Values.affinity }}
      affinity:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with .Values.tolerations }}
      tolerations:
        {{- toYaml . | nindent 8 }}
      {{- end }}
---
apiVersion: v1
kind: Service
metadata:
  name: {{ .Release.Name }}-user-service
  namespace: {{ .Values.namespace }}
  labels:
    app: user-service
spec:
  type: {{ .Values.service.type }}
  ports:
    - port: {{ .Values.service.port }}
      targetPort: http
      protocol: TCP
      name: http
  selector:
    app: user-service
---
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: {{ .Release.Name }}-user-service-hpa
  namespace: {{ .Values.namespace }}
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: {{ .Release.Name }}-user-service
  minReplicas: {{ .Values.hpa.minReplicas }}
  maxReplicas: {{ .Values.hpa.maxReplicas }}
  metrics:
    - type: Resource
      resource:
        name: cpu
        target:
          type: Utilization
          averageUtilization: {{ .Values.hpa.targetCPUUtilizationPercentage }}
    - type: Resource
      resource:
        name: memory
        target:
          type: Utilization
          averageUtilization: {{ .Values.hpa.targetMemoryUtilizationPercentage }}
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-user-service-config
  namespace: {{ .Values.namespace }}
data:
  DATABASE_HOST: "{{ .Values.config.database.host }}"
  DATABASE_PORT: "{{ .Values.config.database.port | quote }}"
  DATABASE_NAME: "{{ .Values.config.database.name }}"
  LOG_LEVEL: "{{ .Values.config.logLevel }}"
  CACHE_TTL: "{{ .Values.config.cache.ttl | quote }}"
// === ARCHIVO: microservices/user-service/templates/service.yaml ===
apiVersion: v1
kind: Service
metadata:
  name: {{ .Release.Name }}-user-service
  namespace: {{ .Values.namespace }}
  labels:
    app: user-service
    environment: {{ .Values.environment }}
    team: {{ .Values.team }}
  annotations:
    description: "Servicio de gestión de usuarios"
    {{- if .Values.service.annotations }}
    {{- range $key, $value := .Values.service.annotations }}
    {{ $key }}: "{{ $value }}"
    {{- end }}
    {{- end }}
spec:
  type: {{ .Values.service.type }}
  clusterIP: {{ .Values.service.clusterIP | default "None" }}
  sessionAffinity: {{ .Values.service.sessionAffinity | default "None" }}
  ports:
    - name: http
      port: {{ .Values.service.port }}
      targetPort: {{ .Values.service.targetPort }}
      protocol: {{ .Values.service.protocol }}
      {{- if .Values.service.nodePort }}
      nodePort: {{ .Values.service.nodePort }}
      {{- end }}
    - name: metrics
      port: {{ .Values.service.metricsPort }}
      targetPort: metrics
      protocol: TCP
  selector:
    app: user-service
---
apiVersion: v1
kind: Service
metadata:
  name: {{ .Release.Name }}-user-service-headless
  namespace: {{ .Values.namespace }}
  labels:
    app: user-service
    purpose: headless
spec:
  clusterIP: None
  ports:
    - name: http
      port: {{ .Values.service.port }}
      targetPort: {{ .Values.service.targetPort }}
      protocol: {{ .Values.service.protocol }}
  selector:
    app: user-service
---
apiVersion: v1
kind: Endpoints
metadata:
  name: {{ .Release.Name }}-user-service
  namespace: {{ .Values.namespace }}
subsets:
  - addresses:
      - ip: "10.0.0.1"
      - ip: "10.0.0.2"
      - ip: "10.0.0.3"
    ports:
      - port: {{ .Values.service.port }}
        protocol: TCP
        name: http
---
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: {{ .Release.Name }}-user-service-network-policy
  namespace: {{ .Values.namespace }}
spec:
  podSelector:
    matchLabels:
      app: user-service
  policyTypes:
    - Ingress
    - Egress
  ingress:
    - from:
        - namespaceSelector:
            matchLabels:
              name: ingress-nginx
        - podSelector:
            matchLabels:
              app: api-gateway
      ports:
        - protocol: TCP
          port: {{ .Values.service.port }}
    - from:
        - podSelector:
            matchLabels:
              app: auth-service
      ports:
        - protocol: TCP
          port: {{ .Values.service.port }}
  egress:
    - to:
        - podSelector:
            matchLabels:
              app: postgres
      ports:
        - protocol: TCP
          port: 5432
    - to:
        - podSelector:
            matchLabels:
              app: redis
      ports:
        - protocol: TCP
          port: 6379
    - to:
        - namespaceSelector: {}
      ports:
        - protocol: TCP
          port: 53
        - protocol: UDP
          port: 53
// === ARCHIVO: microservices/payment-service/Chart.yaml ===
apiVersion: v2
name: payment-service
description: Helm chart for Payment Microservice - Handles payment processing with high availability
type: application
version: 1.0.0
appVersion: "2.5.0"
kubeVersion: ">=1.28.0"
keywords:
  - payment
  - microservice
  - fintech
  - kubernetes
maintainers:
  - name: Platform Team
    email: platform@example.com
    url: https://example.com/team
dependencies:
  - name: common
    version: "1.18.0"
    repository: "https://charts.bitnami.com/common"
  - name: postgresql
    version: "12.12.10"
    repository: "https://charts.bitnami.com/bitnami"
    condition: postgresql.enabled
    alias: database
  - name: redis
    version: "17.15.0"
    repository: "https://charts.bitnami.com/bitnami"
    condition: redis.enabled
    alias: cache
annotations:
  category: Application
  licenses: Apache-2.0
  maintainers: |
    Platform Team - platform@example.com
  tags:
    - payment
    - transaction-processing
    - pci-dss


// === ARCHIVO: microservices/payment-service/values.yaml ===
# Valores dinámicos para el despliegue del servicio de pagos
# Este archivo contiene la configuración que se puede personalizar por entorno

# Configuración de la imagen del contenedor
image:
  repository: myregistry/payment-service
  tag: latest
  pullPolicy: IfNotPresent
  # Puerto en el que escucha la aplicación dentro del contenedor
  port: 8080

# Configuración de réplicas y estrategia de despliegue
replicaCount: 3

strategy:
  type: RollingUpdate
  rollingUpdate:
    maxSurge: 1
    maxUnavailable: 0

# Recursos computacionales para el contenedor
resources:
  limits:
    cpu: 2000m
    memory: 2Gi
  requests:
    cpu: 500m
    memory: 512Mi

# Configuración de Health Checks (Liveness y Readiness)
# Estos probes garantizan que el contenedor esté saludable antes de recibir tráfico
livenessProbe:
  httpGet:
    path: /health/live
    port: 8080
  initialDelaySeconds: 30
  periodSeconds: 10
  timeoutSeconds: 5
  failureThreshold: 3
  successThreshold: 1

readinessProbe:
  httpGet:
    path: /health/ready
    port: 8080
  initialDelaySeconds: 10
  periodSeconds: 5
  timeoutSeconds: 3
  failureThreshold: 3
  successThreshold: 1

# Variables de entorno para la aplicación
# Se usan para configurar la conexión a la base de datos, servicios externos, etc.
env:
  - name: SPRING_PROFILES_ACTIVE
    value: "production"
  - name: DATABASE_HOST
    valueFrom:
      secretKeyRef:
        name: payment-db-secret
        key: host
  - name: DATABASE_PORT
    value: "5432"
  - name: PAYMENT_GATEWAY_URL
    value: "https://api.payment-gateway.com"
  - name: PAYMENT_GATEWAY_API_KEY
    valueFrom:
      secretKeyRef:
        name: payment-gateway-secret
        key: api-key
  - name: LOG_LEVEL
    value: "INFO"
  - name: METRICS_ENABLED
    value: "true"

# Configuración del Service para exponer el microservicio
service:
  type: ClusterIP
  port: 80
  targetPort: 8080
  # Nombre del service - se usa para discovery interno
  name: payment-service
  annotations:
    # Annotations para Prometheus que permiten el scraping de métricas
    prometheus.io/scrape: "true"
    prometheus.io/port: "8080"
    prometheus.io/path: "/actuator/prometheus"

# Configuración de Ingress para exposición externa (opcional)
ingress:
  enabled: true
  className: nginx
  annotations:
    cert-manager.io/cluster-issuer: "letsencrypt-prod"
    nginx.ingress.kubernetes.io/rate-limit: "100"
    nginx.ingress.kubernetes.io/proxy-body-size: "10m"
  hosts:
    - host: payments.example.com
      paths:
        - path: /
          pathType: Prefix
  tls:
    - secretName: payment-service-tls
      hosts:
        - payments.example.com

# Configuración de Horizontal Pod Autoscaler (HPA)
# Permite escalar automáticamente basado en uso de CPU y memoria
autoscaling:
  enabled: true
  minReplicas: 3
  maxReplicas: 20
  targetCPUUtilizationPercentage: 70
  targetMemoryUtilizationPercentage: 80
  # Behavior define la velocidad de scaling up y down
  behavior:
    scaleUp:
      stabilizationWindowSeconds: 60
      policies:
        - type: Percent
          value: 100
          periodSeconds: 15
    scaleDown:
      stabilizationWindowSeconds: 300
      policies:
        - type: Percent
          value: 10
          periodSeconds: 60

# Configuración de Pod Disruption Budget para alta disponibilidad
# Garantiza que siempre haya un mínimo de pods disponibles durante mantenimiento
podDisruptionBudget:
  enabled: true
  minAvailable: 2

# Tolerancias y afinidad para control de scheduling
tolerations:
  - key: "dedicated"
    operator: "Equal"
    value: "payment"
    effect: "NoSchedule"

affinity:
  podAntiAffinity:
    preferredDuringSchedulingIgnoredDuringExecution:
      - weight: 100
        podAffinityTerm:
          labelSelector:
            matchExpressions:
              - key: app
                operator: In
                values:
                  - payment-service
          topologyKey: kubernetes.io/hostname

# Volumes adicionales si son necesarios (ej. para logs persistentes)
volumes:
  - name: payment-logs
    emptyDir: {}

# Configuración de ConfigMap para archivos de configuración
configMaps:
  - name: payment-config
    data:
      application.properties: |
        server.port=8080
        spring.application.name=payment-service
        payment.retry.max-attempts=3
        payment.timeout=30000

# Secrets externos referenciados
# Los valores reales se definen en archivos secretos de Kubernetes
secretRefs:
  - name: payment-db-secret
  - name: payment-gateway-secret

# Políticas de red del cluster (NetworkPolicy)
networkPolicy:
  enabled: true
  # Ingress permitido desde API Gateway y servicios relacionados
  ingressFrom:
    - podSelector:
        matchLabels:
          app: api-gateway
    - podSelector:
        matchLabels:
          app: user-service

// === ARCHIVO: microservices/payment-service/templates/deployment.yaml ===
# Plantilla de despliegue para el servicio de pagos
# ESTE ARCHIVO ES SUPERFICIE DE PRÁCTICA - El estudiante debe completarlo
# El estudiantes debe agregar la configuración completa de un Deployment de Kubernetes
# considerando: recursos, health checks, variables de entorno, volúmenes, etc.
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ include "payment-service.fullname" . }}
  labels:
    {{- include "payment-service.labels" . | nindent 4 }}
spec:
  replicas: {{ .Values.replicaCount }}
  selector:
    matchLabels:
      {{- include "payment-service.selectorLabels" . | nindent 6 }}
  template:
    metadata:
      annotations:
        checksum/config: {{ include (print $.Template.BasePath "/configmap.yaml") . | sha256sum }}
      labels:
        {{- include "payment-service.selectorLabels" . | nindent 8 }}
    spec:
      serviceAccountName: {{ include "payment-service.serviceAccountName" . }}
      securityContext:
        {{- toYaml .Values.podSecurityContext | nindent 8 }}
      containers:
        - name: {{ .Chart.Name }}
          securityContext:
            {{- toYaml .Values.securityContext | nindent 12 }}
          image: "{{ .Values.image.repository }}:{{ .Values.image.tag | default .Chart.AppVersion }}"
          imagePullPolicy: {{ .Values.image.pullPolicy }}
          ports:
            - name: http
              containerPort: {{ .Values.image.port }}
              protocol: TCP
          # TODO: Completar con livenessProbe
          # livenessProbe:
          # TODO: Completar con readinessProbe
          # readinessProbe:
          # TODO: Completar con resources
          # resources:
          # TODO: Completar con env vars
          # env:
      {{- with .Values.nodeSelector }}
      nodeSelector:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with .Values.affinity }}
      affinity:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with .Values.tolerations }}
      tolerations:
        {{- toYaml . | nindent 8 }}
      {{- end }}

// === ARCHIVO: microservices/payment-service/templates/service.yaml ===
# Plantilla de Service para exponer el microservicio de pagos
# Un Service en Kubernetes define un conjunto de pods y la política de acceso a ellos
---
apiVersion: v1
kind: Service
metadata:
  name: {{ include "payment-service.fullname" . }}
  labels:
    {{- include "payment-service.labels" . | nindent 4 }}
  annotations:
    {{- toYaml .Values.service.annotations | nindent 4 }}
spec:
  type: {{ .Values.service.type }}
  ports:
    - port: {{ .Values.service.port }}
      targetPort: {{ .Values.service.targetPort }}
      protocol: TCP
      name: http
  selector:
    {{- include "payment-service.selectorLabels" . | nindent 4 }}


// === ARCHIVO: argocd/argocd-cm.yaml ===
apiVersion: v1
kind: ConfigMap
metadata:
  name: argocd-cm
  namespace: argocd
  labels:
    app.kubernetes.io/name: argocd-cm
    app.kubernetes.io/instance: argocd
    app.kubernetes.io/part-of: argocd
data:
  # URL pública del servidor ArgoCD para acceso externo
  url: https://argocd.platform.example.com
  
  # Configuración del recurso raíz de ArgoCD
  # El recurso raíz es el Application que contiene todas las aplicaciones
  resource.customizations: |
    argoproj.io/Application:
      health.lua: |
        hs = {}
        hs.status = "Progressing"
        hs.message = ""
        if obj.status ~= nil then
          if obj.status.health ~= nil then
            hs.status = obj.status.health.status
            if obj.status.health.message ~= nil then
              hs.message = obj.status.health.message
            end
          end
        end
        return hs
    argoproj.io/AppProject:
      health.lua: |
        return {status = "Healthy", message = "AppProject is healthy"}

  # Política de sincronización automática para aplicaciones
  # Habilita la sincronización automática cuando hay cambios en Git
  application.instanceLabelKey: argocd.argoproj.io/instance
  
  # Configuración de recursos ignoreDifferences para campos mutables
  # Estos campos se ignoran durante la sincronización
  resource.compareoptions: |
    ignoreDifferences:
    - group: apps
      kind: Deployment
      jsonPointers:
      - /spec/replicas
    - group: ""
      kind: ConfigMap
      jsonPointers:
      - /data
    - group: ""
      kind: Secret
      jsonPointers:
      - /data

  # Configuración de tiempo de espera para operaciones
  # Tiempo máximo para sincronización de recursos en segundos
  resource.timeout: "3600"
  
  # Configuración de conexión a repositorios
  # Tipo de conexión: git
  repository.credentials: |
    - type: git
      url: https://github.com/organization/platform-repo
      name: platform-repo

  # Configuración de políticas de sincronización por defecto
  # Aplica a todas las aplicaciones si no se especifica explícitamente
  syncPolicy.default: |
    automated:
      prune: true
      selfHeal: true
      allowEmpty: false
    syncOptions:
    - CreateNamespace=true
    - PruneLast=true
    - PrunePropagationPolicy=foreground
    - Replace=false
    - ServerSideApply=false

  # Configuración de retry para sincronizaciones fallidas
  # Número de reintentos y tiempo de espera entre ellos
  retry.retryLimit: "5"
  retry.retryBackoffDuration: "5s"
  retry.retryBackoffFactor: "2"
  retry.retryBackoffMaxDuration: "3m"

  # Configuración de usuarios y permisos
  # usuarios: |
  #   admin:
  #     password: <encrypted_password>
  #     email: admin@example.com
  #     groups:
  #       - admins

  # Configuración de notificaciones (integración con sistemas externos)
  # notifications: |
  #   enabled: true
  #   webhook:
  #     argocd:
  #       - url: https://argocd.notifications.svc:9090/api/webhook

  # Configuración de TLS y certificados
  # tls.config: |
  #   - name: example.com
  #     ca: |
  #       -----BEGIN CERTIFICATE-----
  #       ...
  #       -----END CERTIFICATE-----

  # Configuración de recursos mínimo y máximo para aplicaciones
  # Límites de recursos que ArgoCD puede gestionar
  resource.limits: |
    cpu: "4000"
    memory: "8192"
    persistentvolumeclaims: "50"
    services: "100"
    configmaps: "100"
    pods: "500"
    jobs: "100"
    cronjobs: "50"
    roles: "50"
    rolebindings: "50"

  # Configuración de análisis de salud personalizado
  # Define cómo ArgoCD evalúa la salud de recursos específicos
  resource.health: |
    customizations:
      CustomResourceDefinition:
        health.lua: |
          return {status = "Healthy", message = "CRD is installed"}
      Ingress:
        health.lua: |
          hs = {}
          hs.status = "Progressing"
          hs.message = ""
          if obj.status ~= nil then
            if obj.status.loadBalancer ~= nil then
              if obj.status.loadBalancer.ingress ~= nil then
                if #obj.status.loadBalancer.ingress > 0 then
                  hs.status = "Healthy"
                  hs.message = "LoadBalancer is provisioned"
                end
              end
            end
          end
          return hs
      Service:
        health.lua: |
          return {status = "Healthy", message = "Service is healthy"}
      Deployment:
        health.lua: |
          hs = {}
          hs.status = "Progressing"
          hs.message = ""
          if obj.status ~= nil then
            if obj.status.readyReplicas ~= nil then
              if obj.status.readyReplicas == obj.spec.replicas then
                hs.status = "Healthy"
                hs.message = "Deployment is ready"
              elseif obj.status.readyReplicas < obj.spec.replicas then
                hs.status = "Progressing"
                hs.message = "Waiting for rollout"
              end
            end
          end
          return hs
      StatefulSet:
        health.lua: |
          hs = {}
          hs.status = "Progressing"
          hs.message = ""
          if obj.status ~= nil then
            if obj.status.readyReplicas ~= nil then
              if obj.status.readyReplicas == obj.spec.replicas then
                hs.status = "Healthy"
                hs.message = "StatefulSet is ready"
              end
            end
          end
          return hs

  # Configuración de comportamiento de garbage collection
  # Recursos huérfanos se limpian automáticamente
  gc.background: "true"
  gc.minInterval: "24h"

  # Configuración de métricas y telemetría
  # Habilita métricas para Prometheus
  metrics.enabled: "true"
  metrics.port: "8082"
  metrics.serviceMonitor.enabled: "true"
  metrics.serviceMonitor.interval: "30s"

  # Configuración de server.governance
  # Habilita políticas de gobernanza
  # server.governance: enabled

  # Configuración de autenticación externa
  # Para integración con proveedores OIDC como Okta, Keycloak, etc.
  # oidc.config: |
  #   name: Okta
  #   issuer: https://dev-example.okta.com
  #   clientID: aabbccdd-1234-5678-90ef-ghijklmnop
  #   clientSecret: $oidc.okta.clientSecret
  #   requestedScopes:
  #     - openid
  #     - profile
  #     - email
  #   requestedIDTokenClaims:
  #     groups: 
  #       essential: true

  # Configuración de sesión de usuario
  # Tiempo de expiración de sesión en segundos
  server.session.maxage: "86400"
  server.session.insecure: "false"

  # Configuración de política de contraseñas
  # passwordPattern: "^((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*])).{8,}$"

  # Configuración de recursos de destino por defecto
  # Namespace por defecto donde se despliegan los recursos
  application.destination.defaultNamespace: default
  
  # Servidor Kubernetes por defecto
  # Puede ser "in-cluster" o una URL de cluster remoto
  application.destination.server: https://kubernetes.default.svc

  # Configuración de build environment
  # environment: production


// === ARCHIVO: monitoring/prometheus/prometheus-config.yaml ===
apiVersion: v1
kind: ConfigMap
metadata:
  name: prometheus-server-conf
  labels:
    name: prometheus-server-conf
  namespace: monitoring
data:
  prometheus.yml: |
    global:
      scrape_interval: 15s
      evaluation_interval: 15s
      external_labels:
        cluster: 'microservices-platform'
        environment: 'production'

    alerting:
      alertmanagers:
        - static_configs:
            - targets:
                - alertmanager.monitoring.svc.cluster.local:9093

    rule_files:
      - "/etc/prometheus/rules/*.yml"

    scrape_configs:
      - job_name: 'prometheus'
        static_configs:
          - targets: ['localhost:9090']
            labels:
              service: 'prometheus'
              type: 'infrastructure'

      - job_name: 'kubernetes-apiserver'
        kubernetes_sd_configs:
          - role: endpoints
        scheme: https
        tls_config:
          ca_file: /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
        bearer_token_file: /var/run/secrets/kubernetes.io/serviceaccount/token
        relabel_configs:
          - source_labels: [__meta_kubernetes_namespace, __meta_kubernetes_service_name, __meta_kubernetes_endpoint_port_name]
            action: keep
            regex: default;kubernetes;https

      - job_name: 'kubernetes-nodes'
        kubernetes_sd_configs:
          - role: node
        scheme: https
        tls_config:
          ca_file: /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
        bearer_token_file: /var/run/secrets/kubernetes.io/serviceaccount/token
        relabel_configs:
          - action: labelmap
            regex: __meta_kubernetes_node_label_(.+)

      - job_name: 'kubernetes-pods'
        kubernetes_sd_configs:
          - role: pod
        relabel_configs:
          - source_labels: [__meta_kubernetes_pod_annotation_prometheus_io_scrape]
            action: keep
            regex: true
          - source_labels: [__meta_kubernetes_pod_annotation_prometheus_io_path]
            action: replace
            target_label: __metrics_path__
            regex: (.+)
          - source_labels: [__address__, __meta_kubernetes_pod_annotation_prometheus_io_port]
            action: replace
            regex: ([^:]+)(?::\d+)?;(\d+)
            replacement: $1:$2
            target_label: __address__
          - action: labelmap
            regex: __meta_kubernetes_pod_label_(.+)
          - source_labels: [__meta_kubernetes_namespace]
            action: replace
            target_label: kubernetes_namespace
          - source_labels: [__meta_kubernetes_pod_name]
            action: replace
            target_label: kubernetes_pod_name

      - job_name: 'auth-service'
        kubernetes_sd_configs:
          - role: endpoints
            namespaces:
              names:
                - microservices
        relabel_configs:
          - source_labels: [__meta_kubernetes_namespace]
            action: keep
            regex: microservices
          - source_labels: [__meta_kubernetes_service_name]
            action: keep
            regex: auth-service
          - source_labels: [__meta_kubernetes_endpoint_port_name]
            action: keep
            regex: http
          - source_labels: [__meta_kubernetes_service_name]
            target_label: service
          - source_labels: [__meta_kubernetes_namespace]
            target_label: namespace
        metrics_path: /actuator/prometheus
        scrape_interval: 10s
        scrape_timeout: 5s

      - job_name: 'user-service'
        kubernetes_sd_configs:
          - role: endpoints
            namespaces:
              names:
                - microservices
        relabel_configs:
          - source_labels: [__meta_kubernetes_namespace]
            action: keep
            regex: microservices
          - source_labels: [__meta_kubernetes_service_name]
            action: keep
            regex: user-service
          - source_labels: [__meta_kubernetes_endpoint_port_name]
            action: keep
            regex: http
          - source_labels: [__meta_kubernetes_service_name]
            target_label: service
          - source_labels: [__meta_kubernetes_namespace]
            target_label: namespace
        metrics_path: /actuator/prometheus
        scrape_interval: 10s
        scrape_timeout: 5s

      - job_name: 'payment-service'
        kubernetes_sd_configs:
          - role: endpoints
            namespaces:
              names:
                - microservices
        relabel_configs:
          - source_labels: [__meta_kubernetes_namespace]
            action: keep
            regex: microservices
          - source_labels: [__meta_kubernetes_service_name]
            action: keep
            regex: payment-service
          - source_labels: [__meta_kubernetes_endpoint_port_name]
            action: keep
            regex: http
          - source_labels: [__meta_kubernetes_service_name]
            target_label: service
          - source_labels: [__meta_kubernetes_namespace]
            target_label: namespace
        metrics_path: /actuator/prometheus
        scrape_interval: 10s
        scrape_timeout: 5s

// === ARCHIVO: monitoring/prometheus/service-monitor.yaml ===
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: auth-service-monitor
  labels:
    release: prometheus
    app: auth-service
    tier: backend
  namespace: monitoring
spec:
  selector:
    matchLabels:
      app: auth-service
      tier: backend
  namespaceSelector:
    matchNames:
      - microservices
  endpoints:
    - port: http
      path: /actuator/prometheus
      interval: 10s
      scrapeTimeout: 5s
      scheme: http
      tlsConfig:
        insecureSkipVerify: false
      relabelings:
        - sourceLabels: [__meta_kubernetes_service_name]
          target_label: service
          replacement: auth-service
        - sourceLabels: [__meta_kubernetes_namespace]
          target_label: namespace
          replacement: microservices
        - sourceLabels: [__meta_kubernetes_pod_name]
          target_label: pod
        - action: labelmap
          regex: __meta_kubernetes_service_label_(.+)
---
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: user-service-monitor
  labels:
    release: prometheus
    app: user-service
    tier: backend
  namespace: monitoring
spec:
  selector:
    matchLabels:
      app: user-service
      tier: backend
  namespaceSelector:
    matchNames:
      - microservices
  endpoints:
    - port: http
      path: /actuator/prometheus
      interval: 10s
      scrapeTimeout: 5s
      scheme: http
      tlsConfig:
        insecureSkipVerify: false
      relabelings:
        - sourceLabels: [__meta_kubernetes_service_name]
          target_label: service
          replacement: user-service
        - sourceLabels: [__meta_kubernetes_namespace]
          target_label: namespace
          replacement: microservices
        - sourceLabels: [__meta_kubernetes_pod_name]
          target_label: pod
        - action: labelmap
          regex: __meta_kubernetes_service_label_(.+)
---
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: payment-service-monitor
  labels:
    release: prometheus
    app: payment-service
    tier: backend
  namespace: monitoring
spec:
  selector:
    matchLabels:
      app: payment-service
      tier: backend
  namespaceSelector:
    matchNames:
      - microservices
  endpoints:
    - port: http
      path: /actuator/prometheus
      interval: 10s
      scrapeTimeout: 5s
      scheme: http
      tlsConfig:
        insecureSkipVerify: false
      relabelings:
        - sourceLabels: [__meta_kubernetes_service_name]
          target_label: service
          replacement: payment-service
        - source_labels: [__meta_kubernetes_namespace]
          target_label: namespace
          replacement: microservices
        - source_labels: [__meta_kubernetes_pod_name]
          target_label: pod
        - action: labelmap
          regex: __meta_kubernetes_service_label_(.+)
---
apiVersion: monitoring.coreos.com/v1
kind: PodMonitor
metadata:
  name: microservices-pod-monitor
  labels:
    release: prometheus
    tier: backend
  namespace: monitoring
spec:
  selector:
    matchLabels:
      tier: backend
  namespaceSelector:
    matchNames:
      - microservices
  podMetricsEndpoints:
    - port: http
      path: /actuator/prometheus
      interval: 15s
      scheme: http
      relabelings:
        - sourceLabels: [__meta_kubernetes_pod_name]
          target_label: pod
        - sourceLabels: [__meta_kubernetes_namespace]
          target_label: namespace
        - action: labelmap
          regex: __meta_kubernetes_pod_label_(.+)
---
apiVersion: monitoring.coreos.com/v1
kind: PrometheusRule
metadata:
  name: microservices-alerts
  labels:
    release: prometheus
  namespace: monitoring
spec:
  groups:
    - name: microservices.rules
      rules:
        - alert: HighErrorRate
          expr: rate(http_requests_total{status=~"5.."}[5m]) > 0.05
          for: 2m
          labels:
            severity: critical
          annotations:
            summary: "Alta tasa de errores en {{ $labels.service }}"
            description: "El servicio {{ $labels.service }} tiene una tasa de errores del {{ $value | humanizePercentage }}"

        - alert: HighLatency
          expr: histogram_quantile(0.95, rate(http_request_duration_seconds_bucket[5m])) > 0.5
          for: 3m
          labels:
            severity: warning
          annotations:
            summary: "Latencia elevada en {{ $labels.service }}"
            description: "P95 latency es {{ $value }}s"

        - alert: ServiceDown
          expr: up{job=~".*-service"} == 0
          for: 1m
          labels:
            severity: critical
          annotations:
            summary: "Servicio {{ $labels.service }} no disponible"
            description: "El servicio ha estado недоступен por más de 1 minuto"

        - alert: HighMemoryUsage
          expr: (container_memory_usage_bytes / container_spec_memory_limit_bytes) > 0.85
          for: 5m
          labels:
            severity: warning
          annotations:
            summary: "Uso de memoria elevado en {{ $labels.pod }}"
            description: "Uso de memoria al {{ $value | humanizePercentage }} del límite"

        - alert: HighCPUUsage
          expr: rate(container_cpu_usage_seconds_total[5m]) > 0.80
          for: 5m
          labels:
            severity: warning
          annotations:
            summary: "Uso de CPU elevado en {{ $labels.pod }}"
            description: "Uso de CPU al {{ $value | humanizePercentage }}"

// === ARCHIVO: monitoring/grafana/dashboards.yaml ===
apiVersion: v1
kind: ConfigMap
metadata:
  name: grafana-dashboards
  labels:
    grafana_dashboard: "1"
  namespace: monitoring
data:
  microservices-dashboard.json: |
    {
      "annotations": {
        "list": [
          {
            "builtIn": 1,
            "datasource": "Prometheus",
            "enable": true,
            "hide": true,
            "iconColor": "rgba(0, 211, 255, 1)",
            "name": "Annotations & Alerts",
            "type": "dashboard"
          }
        ]
      },
      "editable": true,
      "fiscalYearStartMonth": 0,
      "graphTooltip": 1,
      "id": null,
      "links": [],
      "liveNow": false,
      "panels": [
        {
          "datasource": "Prometheus",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "palette-classic"
              },
              "custom": {
                "axisCenteredZero": false,
                "axisColorMode": "text",
                "axisLabel": "",
                "axisPlacement": "auto",
                "barAlignment": 0,
                "drawStyle": "line",
                "fillOpacity": 10,
                "gradientMode": "none",
                "hideFrom": {
                  "tooltip": false,
                  "viz": false,
                  "legend": false
                },
                "lineInterpolation": "linear",
                "lineWidth": 1,
                "pointSize": 5,
                "scaleDistribution": {
                  "type": "linear"
                },
                "showPoints": "never",
                "spanNulls": false,
                "stacking": {
                  "group": "A",
                  "mode": "none"
                },
                "thresholdsStyle": {
                  "mode": "off"
                }
              },
              "mappings": [],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  },
                  {
                    "color": "red",
                    "value": 80
                  }
                ]
              },
              "unit": "reqps"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 12,
            "x": 0,
            "y": 0
          },
          "id": 1,
          "options": {
            "legend": {
              "calcs": ["mean", "lastNotNull", "max"],
              "displayMode": "table",
              "placement": "bottom",
              "showLegend": true
            },
            "tooltip": {
              "mode": "multi",
              "sort": "none"
            }
          },
          "targets": [
            {
              "datasource": "Prometheus",
              "expr": "sum(rate(http_requests_total[1m])) by (service)",
              "refId": "A"
            }
          ],
          "title": "Requests per Second by Service",
          "type": "timeseries"
        },
        {
          "datasource": "Prometheus",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "palette-classic"
              },
              "custom": {
                "axisCenteredZero": false,
                "axisColorMode": "text",
                "axisLabel": "",
                "axisPlacement": "auto",
                "barAlignment": 0,
                "drawStyle": "line",
                "fillOpacity": 10,
                "gradientMode": "none",
                "hideFrom": {
                  "tooltip": false,
                  "viz": false,
                  "legend": false
                },
                "lineInterpolation": "linear",
                "lineWidth": 1,
                "pointSize": 5,
                "scaleDistribution": {
                  "type": "linear"
                },
                "showPoints": "never",
                "spanNulls": false,
                "stacking": {
                  "group": "A",
                  "mode": "none"
                },
                "thresholdsStyle": {
                  "mode": "off"
                }
              },
              "mappings": [],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  }
                ]
              },
              "unit": "s"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 12,
            "x": 12,
            "y": 0
          },
          "id": 2,
          "options": {
            "legend": {
              "calcs": ["mean", "lastNotNull", "max"],
              "displayMode": "table",
              "placement": "bottom",
              "showLegend": true
            },
            "tooltip": {
              "mode": "multi",
              "sort": "none"
            }
          },
          "targets": [
            {
              "datasource": "Prometheus",
              "expr": "histogram_quantile(0.95, sum(rate(http_request_duration_seconds_bucket[1m])) by (service, le))",
              "refId": "A"
            }
          ],
          "title": "P95 Latency by Service",
          "type": "timeseries"
        },
        {
          "datasource": "Prometheus",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  },
                  {
                    "color": "yellow",
                    "value": 1
                  },
                  {
                    "color": "red",
                    "value": 5
                  }
                ]
              },
              "unit": "percentunit"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 4,
            "w": 8,
            "x": 0,
            "y": 8
          },
          "id": 3,
          "options": {
            "colorMode": "value",
            "graphMode": "area",
            "justifyMode": "auto",
            "orientation": "auto",
            "reduceOptions": {
              "calcs": ["lastNotNull"],
              "fields": "",
              "values": false
            },
            "textMode": "auto"
          },
          "targets": [
            {
              "datasource": "Prometheus",
              "expr": "sum(rate(http_requests_total{status=\"500\"}[5m])) / sum(rate(http_requests_total[5m]))",
              "refId": "A"
            }
          ],
          "title": "Error Rate (5xx)",
          "type": "stat"
        },
        {
          "datasource": "Prometheus",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  },
                  {
                    "color": "yellow",
                    "value": 0.7
                  },
                  {
                    "color": "red",
                    "value": 0.85
                  }
                ]
              },
              "unit": "percentunit"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 4,
            "w": 8,
            "x": 8,
            "y": 8
          },
          "id": 4,
          "options": {
            "colorMode": "value",
            "graphMode": "area",
            "justifyMode": "auto",
            "orientation": "auto",
            "reduceOptions": {
              "calcs": ["lastNotNull"],
              "fields": "",
              "values": false
            },
            "textMode": "auto"
          },
          "targets": [
            {
              "datasource": "Prometheus",
              "expr": "avg(container_memory_usage_bytes / container_spec_memory_limit_bytes)",
              "refId": "A"
            }
          ],
          "title": "Avg Memory Usage",
          "type": "stat"
        },
        {
          "datasource": "Prometheus",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  },
                  {
                    "color": "yellow",
                    "value": 0.7
                  },
                  {
                    "color": "red",
                    "value": 0.85
                  }
                ]
              },
              "unit": "percentunit"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 4,
            "w": 8,
            "x": 16,
            "y": 8
          },
          "id": 5,
          "options": {
            "colorMode": "value",
            "graphMode": "area",
            "justifyMode": "auto",
            "orientation": "auto",
            "reduceOptions": {
              "calcs": ["lastNotNull"],
              "fields": "",
              "values": false
            },
            "textMode": "auto"
          },
          "targets": [
            {
              "datasource": "Prometheus",
              "expr": "avg(rate(container_cpu_usage_seconds_total[1m]))",
              "refId": "A"
            }
          ],
          "title": "Avg CPU Usage",
          "type": "stat"
        },
        {
          "datasource": "Prometheus",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "palette-classic"
              },
              "custom": {
                "axisCenteredZero": false,
                "axisColorMode": "text",
                "axisLabel": "",
                "axisPlacement": "auto",
                "barAlignment": 0,
                "drawStyle": "line",
                "fillOpacity": 10,
                "gradientMode": "none",
                "hideFrom": {
                  "tooltip": false,
                  "viz": false,
                  "legend": false
                },
                "lineInterpolation": "linear",
                "lineWidth": 1,
                "pointSize": 5,
                "scaleDistribution": {
                  "type": "linear"
                },
                "showPoints": "never",
                "spanNulls": false,
                "stacking": {
                  "group": "A",
                  "mode": "none"
                },
                "thresholdsStyle": {
                  "mode": "off"
                }
              },
              "mappings": [],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  }
                ]
              },
              "unit": "bytes"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 12,
            "x": 0,
            "y": 12
          },
          "id": 6,
          "options": {
            "legend": {
              "calcs": ["mean", "lastNotNull", "max"],
              "displayMode": "table",
              "placement": "bottom",
              "showLegend": true
            },
            "tooltip": {
              "mode": "multi",
              "sort": "none"
            }
          },
          "targets": [
            {
              "datasource": "Prometheus",
              "expr": "container_memory_usage_bytes{namespace=\"microservices\"}",
              "refId": "A"
            }
          ],
          "title": "Memory Usage by Pod",
          "type": "timeseries"
        },
        {
          "datasource": "Prometheus",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "palette-classic"
              },
              "custom": {
                "axisCenteredZero": false,
                "axisColorMode": "text",
                "axisLabel": "",
                "axisPlacement": "auto",
                "barAlignment": 0,
                "drawStyle": "line",
                "fillOpacity": 10,
                "gradientMode": "none",
                "hideFrom": {
                  "tooltip": false,
                  "viz": false,
                  "legend": false
                },
                "lineInterpolation": "linear",
                "lineWidth": 1,
                "pointSize": 5,
                "scaleDistribution": {
                  "type": "linear"
                },
                "showPoints": "never",
                "spanNulls": false,
                "stacking": {
                  "group": "A",
                  "mode": "none"
                },
                "thresholdsStyle": {
                  "mode": "off"
                }
              },
              "mappings": [],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  }
                ]
              },
              "unit": "percentunit"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 8,
            "w": 12,
            "x": 12,
            "y": 12
          },
          "id": 7,
          "options": {
            "legend": {
              "calcs": ["mean", "lastNotNull", "max"],
              "displayMode": "table",
              "placement": "bottom",
              "showLegend": true
            },
            "tooltip": {
              "mode": "multi",
              "sort": "none"
            }
          },
          "targets": [
            {
              "datasource": "Prometheus",
              "expr": "rate(container_cpu_usage_seconds_total{namespace=\"microservices\"}[1m])",
              "refId": "A"
            }
          ],
          "title": "CPU Usage by Pod",
          "type": "timeseries"
        }
      ],
      "refresh": "10s",
      "schemaVersion": 38,
      "style": "dark",
      "tags": ["microservices", "kubernetes"],
      "templating": {
        "list": []
      },
      "time": {
        "from": "now-1h",
        "to": "now"
      },
      "timepicker": {},
      "timezone": "",
      "title": "Microservices Platform Overview",
      "uid": "microservices-overview",
      "version": 1,
      "weekStart": ""
    }


// === ARCHIVO: monitoring/grafana/grafana-config.yaml ===
apiVersion: v1
kind: ConfigMap
metadata:
  name: grafana-config
  namespace: monitoring
  labels:
    app: grafana
    component: config
data:
  grafana.ini: |-
    [server]
    protocol = http
    http_addr = 0.0.0.0
    http_port = 3000
    domain = grafana.monitoring.svc.cluster.local
    root_url = %(protocol)s://%(domain)s/
    enable_gzip = true
    
    [database]
    type = sqlite3
    path = /var/lib/grafana/grafana.db
    cache_mode = private
    
    [session]
    provider = file
    
    [analytics]
    reporting_enabled = false
    check_for_updates = true
    
    [security]
    admin_user = admin
    admin_password = ${GRAFANA_ADMIN_PASSWORD}
    disable_gravatar = true
    cookie_secure = false
    cookie_samesite = lax
    
    [users]
    allow_sign_up = false
    allow_org_create = false
    auto_assign_org = true
    auto_assign_org_role = Viewer
    default_theme = dark
    
    [auth.anonymous]
    enabled = false
    
    [auth.basic]
    enabled = true
    
    [auth]
    disable_login_form = false
    disable_signout_menu = false
    
    [log]
    mode = console
    level = info
    
    [log.console]
    level = info
    format = text
    
    [paths]
    data = /var/lib/grafana
    logs = /var/log/grafana
    plugins = /var/lib/grafana/plugins
    provisioning = /etc/grafana/provisioning
    
    [dashboards]
    default_home_dashboard_path = /var/lib/grafana/dashboards/default/kubernetes-overview.json
    
    [unified_alerting]
    enabled = true
    
    [alerting]
    enabled = false
    
    [feature_toggles]
    enable = live
    
    [metrics]
    enabled = true
    interval_seconds = 10
    
    [grafana_net]
    url = https://grafana.net

  datasources.yml: |-
    apiVersion: 1
    
    datasources:
      - name: Prometheus
        type: prometheus
        access: proxy
        url: http://prometheus-server.monitoring.svc.cluster.local:9090
        isDefault: true
        editable: false
        jsonData:
          httpMethod: POST
          timeInterval: 15s
          queryTimeout: 60s
          manageAlerts: true
          prometheusType: Prometheus
          prometheusVersion: 2.47.0
          cacheTimeout: 30s
          httpMode: POST
        secureJsonData: {}
        version: 1
        readOnly: false
        uid: prometheus-main

  provisioning.yml: |-
    apiVersion: 1
    
    providers:
      - name: 'Dashboards Provider'
        orgId: 1
        folder: ''
        type: file
        disableDeletion: false
        updateIntervalSeconds: 10
        allowUiUpdates: true
        options:
          path: /var/lib/grafana/dashboards
          foldersFromFilesStructure: true
      
      - name: 'Datasource Provider'
        orgId: 1
        name: 'Datasource Provider'
        type: file
        disableDeletion: false
        updateIntervalSeconds: 10
        allowUiUpdates: true
        options:
          path: /etc/grafana/provisioning/datasources

  dashboard-providers.yml: |-
    apiVersion: 1
    
    dashboardProviders:
      dashboardproviders.yaml:
        apiVersion: 1
        providers:
          - name: 'default'
            orgId: 1
            folder: ''
            type: file
            disableDeletion: true
            updateIntervalSeconds: 30
            allowUiUpdates: true
            options:
              path: /var/lib/grafana/dashboards/default
              foldersFromFilesStructure: true
          - name: 'kubernetes'
            orgId: 1
            folder: 'Kubernetes'
            type: file
            disableDeletion: true
            updateIntervalSeconds: 30
            allowUiUpdates: true
            options:
              path: /var/lib/grafana/dashboards/kubernetes
              foldersFromFilesStructure: true
          - name: 'microservices'
            orgId: 1
            folder: 'Microservicios'
            type: file
            disableDeletion: true
            updateIntervalSeconds: 30
            allowUiUpdates: true
            options:
              path: /var/lib/grafana/dashboards/microservices
              foldersFromFilesStructure: true

  notifiers.yml: |-
    apiVersion: 1
    
    notifiers:
      - name: 'Alertas Slack'
        type: slack
        uid: slack-notifier
        is_default: true
        send_reminder: true
        frequency: 4h
        settings:
          url: ${SLACK_WEBHOOK_URL}
          recipient: '#alertas-monitoreo'
          username: 'Grafana Alerts'
          icon_emoji: ':warning:'
          mentionChannel: 'channel'
          uploadImage: true
      
      - name: 'Alertas Email'
        type: email
        uid: email-notifier
        is_default: false
        settings:
          addresses: devops-team@empresa.com;oncall@empresa.com
          singleEmail: false
          uploadImage: true

  alert-notifications.yml: |-
    apiVersion: 1
    
    alert_notifications:
      - id: 1
        name: 'Slack Alerts'
        type: slack
        is_default: true
        send_reminder: true
        frequency: 4h
        settings:
          url: ${SLACK_WEBHOOK_URL}
          recipient: '#alertas-monitoreo'
      - id: 2
        name: 'Email Alerts'
        type: email
        is_default: false
        settings:
          addresses: devops-team@empresa.com
          singleEmail: false

```
