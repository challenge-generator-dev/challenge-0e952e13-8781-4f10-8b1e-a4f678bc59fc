# Despliegue de plataforma de microservicios con Kubernetes

El equipo de DevOps necesita desplegar una plataforma de microservicios utilizando Kubernetes, Helm, GitOps con ArgoCD, y monitoreo con Prometheus y Grafana. La plataforma debe soportar alta disponibilidad, escalabilidad y monitoreo en tiempo real. Los microservicios incluirán un servicio de autenticación, un servicio de usuarios y un servicio de pagos. El sistema debe manejar un tráfico de 10 000 solicitudes por segundo con un tiempo de respuesta promedio de 200 ms.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Kubernetes DevOps |
| **Nivel** | advanced-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 20 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y generará un ZIP listo para usar.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: Un IDE o editor de código.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y generará un archivo ZIP descargable. Descárgalo y extráelo en la carpeta donde quieras trabajar.
- Verifica que el proyecto arranca sin errores.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no genera el ZIP automáticamente al terminar el análisis, escríbele: "genera el ZIP ahora".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Configuración inicial de Kubernetes

**Objetivo:** Configurar un cluster de Kubernetes funcional con alta disponibilidad.

**Tiempo estimado:** 5 horas

**Instrucciones:**

- Identificar y configurar los nodos del cluster para asegurar alta disponibilidad.
- Verificar que el cluster pueda manejar el tráfico esperado.
- Documentar la configuración y los pasos seguidos.

**Entregable:** Cluster de Kubernetes configurado y documentado.

<details>
<summary>Pistas de conocimiento</summary>

- Considerar la replicación de nodos y la distribución de carga.
- Evaluar la necesidad de un balanceador de carga externo.

</details>

### Fase 2: Despliegue de microservicios con Helm

**Objetivo:** Desplegar los microservicios de autenticación, usuarios y pagos utilizando Helm.

**Tiempo estimado:** 5 horas

**Instrucciones:**

- Crear y configurar los charts de Helm para cada microservicio.
- Verificar que los microservicios se despliegan correctamente y están disponibles.
- Documentar la configuración de Helm y los charts utilizados.

**Entregable:** Microservicios desplegados y documentados utilizando Helm.

<details>
<summary>Pistas de conocimiento</summary>

- Utilizar valores dinámicos en los charts de Helm.
- Configurar dependencias entre microservicios.

</details>

### Fase 3: Implementación de GitOps con ArgoCD

**Objetivo:** Configurar ArgoCD para gestionar el despliegue de los microservicios.

**Tiempo estimado:** 5 horas

**Instrucciones:**

- Configurar ArgoCD para sincronizar los repositorios de los microservicios con el cluster de Kubernetes.
- Verificar que los cambios en los repositorios se reflejen automáticamente en el cluster.
- Documentar la configuración de ArgoCD y los repositorios utilizados.

**Entregable:** Configuración de ArgoCD para gestionar el despliegue de microservicios.

<details>
<summary>Pistas de conocimiento</summary>

- Utilizar webhooks para notificar cambios en los repositorios.
- Configurar políticas de sincronización automática.

</details>

### Fase 4: Configuración de monitoreo con Prometheus y Grafana

**Objetivo:** Configurar Prometheus y Grafana para monitorear los microservicios.

**Tiempo estimado:** 5 horas

**Instrucciones:**

- Configurar Prometheus para recopilar métricas de los microservicios.
- Configurar Grafana para visualizar las métricas recopiladas.
- Verificar que las métricas se recopilan y visualizan correctamente.
- Documentar la configuración de Prometheus y Grafana.

**Entregable:** Configuración de Prometheus y Grafana para monitorear los microservicios.

<details>
<summary>Pistas de conocimiento</summary>

- Utilizar exporters para recopilar métricas de aplicaciones personalizadas.
- Configurar alertas en Grafana para notificar eventos críticos.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es Kubernetes y por qué se utiliza en este contexto?
- **paraQueSirve**: ¿Para qué sirve Helm en el despliegue de microservicios?
- **comoSeUsa**: ¿Cómo se utiliza ArgoCD para implementar GitOps?
- **erroresComunes**: ¿Cuáles son los errores comunes al configurar Prometheus y Grafana?
- **queDecisionesImplica**: ¿Qué decisiones implica la configuración de un cluster de Kubernetes para alta disponibilidad?

## Criterios de Evaluacion

- Configuración de un cluster de Kubernetes funcional con alta disponibilidad.
- Despliegue de microservicios utilizando Helm.
- Configuración de ArgoCD para gestionar el despliegue de microservicios.
- Configuración de Prometheus y Grafana para monitorear los microservicios.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT). Devuelve un ZIP con el proyecto. Sirve si no tenes un agente en el IDE.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
docker build -t reto:local . && terraform -chdir=terraform init -backend=false && terraform -chdir=terraform validate
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
