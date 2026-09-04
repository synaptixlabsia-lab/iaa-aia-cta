# Mini-proyecto 2 — Tu n8n conectado a una página web, con seguridad real

## Qué trae esta carpeta

- `chat-widget.html` — un widget de chat embebible, ya con el header de la clave secreta
  integrado. Cada quien reemplaza `N8N_CHAT_URL` y `SECRET_KEY` con sus propios valores.
- `webhook-con-header-auth.json` — el flujo con Chat Trigger + Header Auth, protegido de verdad.

**⚠️ Hay un punto marcado como "verificar al importar" en `PROMPT.md`** — no está confirmado si el
Chat Trigger soporta Header Auth igual que un Webhook normal en la versión instalada. Léelo antes
de prometer que funciona tal cual.

## La corrección de seguridad importante

**No se usa un nodo `IF` para comparar una clave secreta** — ese patrón ya se probó en un
laboratorio anterior y falla en rechazar tokens inválidos de forma confiable. Se usa **Header Auth
nativo de n8n**, configurado directo en el nodo Webhook/Chat Trigger (pestaña Authentication).
