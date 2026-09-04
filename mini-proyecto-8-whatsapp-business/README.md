# Mini-proyecto 8 — El mismo patrón, pero en WhatsApp

**La idea central: es el mismo patrón de Telegram que ya dominan, con otro nombre de nodo.** Todo
el curso practicaron con Telegram porque es gratis y rápido de configurar — pero casi ningún
cliente real de un ISP latinoamericano usa Telegram. WhatsApp es el canal real. La buena noticia:
la arquitectura no cambia — Trigger → (RAG/Agent) → Responder — solo cambian las credenciales y
algunos detalles de configuración propios de Meta.

## Documentación oficial (verificada, no inventada)

- **[Meta — WhatsApp Cloud API, Get Started](https://developers.facebook.com/docs/whatsapp/cloud-api/get-started)**
  — cómo crear el token de acceso, el Phone Number ID, y configurar el webhook.
- **[n8n — WhatsApp Trigger](https://docs.n8n.io/integrations/builtin/trigger-nodes/n8n-nodes-base.whatsapptrigger)**
  y **[WhatsApp Business Cloud node](https://docs.n8n.io/integrations/builtin/app-nodes/n8n-nodes-base.whatsapp)**
  — los dos nodos nativos que reemplazan a `Telegram Trigger` y `Telegram` en los flujos que ya
  construyeron.

## Las diferencias reales con Telegram (esto es lo que cambia)

1. **Meta solo permite UN webhook registrado por app.** Si cambian de la URL de prueba a la de
   producción, Meta sobreescribe el webhook anterior — no pueden tener las dos activas a la vez
   como sí podían alternar libremente con el túnel de Telegram.
2. **Meta espera una respuesta 200 en menos de 5 segundos.** Si el flujo tarda (por ejemplo,
   esperando al AI Agent), el primer nodo debe devolver 200 de inmediato y seguir procesando
   después — si no, Meta puede desactivar el webhook. Esto es distinto a Telegram, que es más
   permisivo con el tiempo de respuesta.
3. **Ventana de 24 horas ("customer service window").** Solo pueden responder libremente dentro
   de las 24 horas después de que el cliente escribió — pasado ese tiempo, hay que usar plantillas
   de mensaje pre-aprobadas por Meta para volver a contactarlo. Telegram no tiene esta restricción.
4. **Verificación del webhook (`hub.challenge`)** — Meta hace una verificación inicial por GET con
   un token que ustedes definen, antes de aceptar el webhook. El nodo `WhatsApp Trigger` de n8n
   maneja esto automáticamente, pero hay que configurar el mismo `verify_token` en ambos lados
   (Meta y n8n) para que la verificación pase.

## Qué trae esta carpeta

- `consulta-whatsapp-supabase.json` — el mismo patrón de `mini-proyecto-1` (Trigger → AI Agent con
  RAG → Responder), adaptado a los nodos de WhatsApp en vez de Telegram. **VERIFICAR AL IMPORTAR**:
  las credenciales de WhatsApp Business Cloud son más largas de configurar que las de Telegram —
  sigue `PROMPT.md` de esta carpeta antes de intentar correrlo.
