# Mini-proyecto 2 — Tu n8n conectado a una página web, con seguridad real

## Qué trae esta carpeta

- `chat-widget.html` — un widget de chat embebible, ya con el header de la clave secreta
  integrado. Cada quien reemplaza `N8N_CHAT_URL` y `SECRET_KEY` con sus propios valores.
- `webhook-con-header-auth.json` — el flujo con un nodo **Webhook normal** (`n8n-nodes-base.webhook`,
  no un Chat Trigger) + Header Auth, protegido de verdad. El `path` viene con un valor de ejemplo
  (`pruebawebhook-conectanet`) que cada quien puede y debe cambiar al importar.

## Por qué es un Webhook y no un Chat Trigger

El nodo `@n8n/n8n-nodes-langchain.chatTrigger` es más nuevo y no siempre expone las mismas opciones
de autenticación que el **Webhook base de n8n**. Para no depender de eso, este flujo usa un Webhook
normal desde el inicio: `Webhook → Preparar Input (Set) → AI Agent → Respond to Webhook`. El nodo
Set extrae `chatInput` y `sessionId` de `$json.body` (así llega el payload en un Webhook normal, a
diferencia del Chat Trigger que los expone directo), y `Respond to Webhook` devuelve
`{ "output": "..." }` en JSON — el mismo formato que ya espera `chat-widget.html`.

## La corrección de seguridad importante

**No se usa un nodo `IF` para comparar una clave secreta** — ese patrón ya se probó en un
laboratorio anterior y falla en rechazar tokens inválidos de forma confiable. Se usa **Header Auth
nativo de n8n**, configurado directo en la pestaña Authentication del nodo Webhook.
