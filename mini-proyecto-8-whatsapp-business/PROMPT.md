# PROMPT — Mini-proyecto 8: el mismo patrón, en WhatsApp

Lee `README.md` primero. Este mini-proyecto asume que el usuario ya tiene su RAG funcionando por
Telegram (mini-proyecto 1) — aquí solo se migra el canal, no se rehace el RAG.

## ⚠️ Verificar al importar — más que en cualquier otro mini-proyecto

Los nombres exactos de parámetros de los nodos `WhatsApp Trigger` y `WhatsApp Business Cloud`
pueden variar según la versión de n8n instalada — a diferencia de Telegram, que llevan más tiempo
estables. **Antes de prometerle al usuario que el JSON funciona tal cual, ábrelo y compara los
campos contra lo que aparece de verdad en la UI del nodo.** Si algo no coincide (el campo de
destinatario, el nombre exacto del `phoneNumberId`), ayúdalo a reconfigurarlo ahí mismo — repórtalo
como `Bloqueado` con la razón exacta si no puedes confirmarlo, no fuerces algo sin verificar.

## Fase 1 — Setup en Meta (esto toma más tiempo que Telegram)

Guía al usuario con la [documentación oficial de Meta](https://developers.facebook.com/docs/whatsapp/cloud-api/get-started)
para: crear la app en Meta for Developers, obtener el Phone Number ID de prueba, generar el
token de acceso, y configurar el webhook con un `verify_token` que el usuario defina. **Nunca le
pidas que pegue el token en el chat** — dile exactamente en qué pantalla de n8n crear la
credencial.

## Fase 2 — Importar y ajustar el workflow

Importa `consulta-whatsapp-supabase.json`. Confirma:
- El nodo "Responder 200 inmediato a Meta" está conectado directo desde el trigger, en paralelo al
  AI Agent — esto es lo que evita que Meta desactive el webhook por demora (ver README, punto 2).
- Las credenciales de WhatsApp apuntan a las reales del usuario.
- El nodo de respuesta usa el número de teléfono correcto como destinatario, no un texto fijo de
  ejemplo.

## Fase 3 — Probar dentro de la ventana de 24 horas

Envía un mensaje de WhatsApp real al número de prueba y confirma que el bot responde usando el RAG
— igual que probaron con Telegram. Recuerda al usuario que fuera de las 24 horas después del
último mensaje del cliente, WhatsApp exige usar una plantilla pre-aprobada para reabrir la
conversación — eso no se resuelve hoy, solo hay que saber que existe.

## Prompts de prueba

```text
Lee mini-proyecto-8. Ayúdame a configurar mi app de WhatsApp Business en Meta
for Developers y a crear la credencial en n8n — no me pidas el token pegado
en el chat, dime en qué pantalla de n8n lo pongo.
```

```text
Importa consulta-whatsapp-supabase.json y verifica en la UI real del nodo si
los campos coinciden con lo que trae el JSON — si algo no coincide,
ayúdame a corregirlo ahí mismo antes de intentar correrlo.
```

```text
Mándame un mensaje de prueba por WhatsApp al número configurado y confírmame
que el bot respondió usando el mismo RAG que ya probé por Telegram.
```
