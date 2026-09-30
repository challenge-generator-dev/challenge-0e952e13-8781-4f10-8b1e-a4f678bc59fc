# AGENTS.md

Instrucciones para el agente de IA que abra este repositorio (Claude Code, Cursor, Codex, Copilot, Gemini). Se cargan solas: no hay que pegar nada en ningun chat.

## Que es este repositorio

Es el codigo base de un reto de aprendizaje de Pragma: **Despliegue de plataforma de microservicios con Kubernetes**.

| | |
|---|---|
| Tema | Kubernetes DevOps |
| Nivel | advanced-l2 |
| Chapter | DevSecOps |
| Especialidad | DevSecOps |
| Stack | YAML / Kubernetes |
| Patron arquitectonico | microservicios con GitOps y observabilidad |
| Tiempo estimado | 20 horas |

## Receta del stack

Esqueleto obligatorio:

- `azure-pipelines.yml o .github/workflows/*.yml con stages reales`
- `Dockerfile multi-stage`
- `.dockerignore`
- `terraform/ con main.tf, variables.tf y outputs.tf`
- `terraform/environments/{env}/terraform.tfvars`
- `scripts/ con los scripts de build y healthcheck`
- `sonar-project.properties`

Trampas conocidas:

- `required_version` de Terraform va como RANGO (`>= 1.5`), nunca exacto: pineado, el proyecto no corre con otra version instalada.
- Los providers tambien con restriccion flexible (`~> 5.0`).
- El Dockerfile multi-stage necesita que la etapa final copie el artefacto de la etapa de build, no el codigo fuente.

Dependencias:

- kubernetes/kubernetes 1.28.0
- helm/helm 3.13.0
- argoproj/argo-cd 2.9.3
- prometheus/prometheus 2.47.0
- grafana/grafana 10.2.0

## Tu tarea

Dejar este proyecto en estado **verificable**: que el comando de verificacion corra sin errores. Escribi los archivos en disco, en este repositorio. No generes ZIPs ni archivos adjuntos.

En orden:

1. Corre `docker build -t reto:local . && terraform -chdir=terraform init -backend=false && terraform -chdir=terraform validate` y mira que falla.
2. Completa lo que falte de la lista de abajo: manifiesto de dependencias, punto de entrada, capa de interfaz y las capas del patron declarado.
3. Arregla SOLO los errores que impiden compilar o arrancar.
4. Volve a correr `docker build -t reto:local . && terraform -chdir=terraform init -backend=false && terraform -chdir=terraform validate` hasta que pase.
5. Pará ahí.

## Regla dura: las fases son trabajo del humano

**PROHIBIDO implementar los entregables de las fases.** El valor del reto esta en que la persona los resuelva. Tu trabajo es que tenga un proyecto que arranca; el hueco pedagogico se queda como esta.

No resuelvas nada de esto:

- **Fase 1 — Configuración inicial de Kubernetes**: Cluster de Kubernetes configurado y documentado.
- **Fase 2 — Despliegue de microservicios con Helm**: Microservicios desplegados y documentados utilizando Helm.
- **Fase 3 — Implementación de GitOps con ArgoCD**: Configuración de ArgoCD para gestionar el despliegue de microservicios.
- **Fase 4 — Configuración de monitoreo con Prometheus y Grafana**: Configuración de Prometheus y Grafana para monitorear los microservicios.

Distincion operativa:

- **Arreglar** (si): import faltante, tipo que no existe, dependencia sin declarar, error de sintaxis, archivo referenciado que no existe.
- **No tocar** (no): logica de negocio incompleta, validaciones ausentes, secretos hardcodeados, APIs deprecadas que funcionan, concurrencia insegura, patrones mejorables. Eso es lo que la persona tiene que encontrar.

## Superficie de practica (NO completes)

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs. No toques la logica que el reto pide completar.

- [ ] `microservices/auth-service/templates/deployment.yaml` — El topic pide contenedores/orquestacion: este archivo es el ejercicio, no scaffolding.
- [ ] `microservices/user-service/templates/deployment.yaml` — El topic pide contenedores/orquestacion: este archivo es el ejercicio, no scaffolding.
- [ ] `microservices/payment-service/templates/deployment.yaml` — El topic pide contenedores/orquestacion: este archivo es el ejercicio, no scaffolding.

## Lo que falta y tenes que completar

### 1. Archivos que la arquitectura declara (1 de 24)

La propuesta arquitectonica del reto los lista y no llegaron al repo. Crealos con implementacion real, respetando la capa en la que viven:

- [ ] `microservices/user-service/values.yaml`

### Presentes (23)

- `providers.tf`
- `variables.tf`
- `argocd/application.yaml`
- `main.tf`
- `README.md`
- `cluster/nodes-config.yaml`
- `cluster/loadbalancer.yaml`
- `microservices/auth-service/Chart.yaml`
- `microservices/auth-service/values.yaml`
- `microservices/auth-service/templates/deployment.yaml`
- `microservices/auth-service/templates/service.yaml`
- `microservices/user-service/Chart.yaml`
- `microservices/user-service/templates/deployment.yaml`
- `microservices/user-service/templates/service.yaml`
- `microservices/payment-service/Chart.yaml`
- `microservices/payment-service/values.yaml`
- `microservices/payment-service/templates/deployment.yaml`
- `microservices/payment-service/templates/service.yaml`
- `argocd/argocd-cm.yaml`
- `monitoring/prometheus/prometheus-config.yaml`
- `monitoring/prometheus/service-monitor.yaml`
- `monitoring/grafana/dashboards.yaml`
- `monitoring/grafana/grafana-config.yaml`

### Capas del patron declarado

Cada una tiene que existir como directorio real con al menos un archivo. Codigo plano en la raiz no satisface el patron.

- `cluster/`
- `microservices/`
- `microservices/auth-service/`
- `microservices/auth-service/templates/`
- `microservices/user-service/`
- `microservices/user-service/templates/`
- `microservices/payment-service/`
- `microservices/payment-service/templates/`
- `argocd/`
- `monitoring/`
- `monitoring/prometheus/`
- `monitoring/grafana/`

## Verificacion

```bash
docker build -t reto:local . && terraform -chdir=terraform init -backend=false && terraform -chdir=terraform validate
```

El comando tiene que pasar SIN implementar los archivos de la superficie de practica: solo andamiaje.

Ese comando pasando es la definicion de "terminado" para vos.

## Convenciones que tenes que respetar

- Un solo ecosistema: no declares librerias de otro lenguaje ni mezcles gestores de paquetes.
- Toda libreria que uses tiene que estar declarada en el manifiesto de dependencias.
- Todo import declarado tiene que usarse; todo tipo usado tiene que existir o venir de una dependencia declarada.
- El patron es **microservicios con GitOps y observabilidad**: los contratos (interfaces, puertos) los define la capa interna y los implementa la externa, nunca al revés.
- Los archivos que crees llevan implementacion real, no stubs: sin `TODO`, sin cuerpos vacios, sin `// getters y setters`.

## Contexto del candidato

Sirve para calibrar el nivel del codigo, no para resolver las fases.

- Brecha que el reto ataca: Diseñar y desplegar una plataforma de microservicios con Kubernetes, Helm, GitOps con ArgoCD y monitoreo con Prometheus y Grafana

---

*Generado por Challenge Generator — Pragma. `README.md` tiene el enunciado completo del reto para la persona. `PROMPT_MEJORA.md` es la variante para pegar en un chat, si se prefiere ese flujo.*
