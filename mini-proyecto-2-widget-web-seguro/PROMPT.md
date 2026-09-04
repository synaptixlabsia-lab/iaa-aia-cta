# PROMPT — Mini-proyecto 2: widget web seguro

Lee `README.md` de esta carpeta primero. A diferencia del mini-proyecto 1, aquí sí vas a construir
cosas nuevas — con vibe coding en vivo. El foco no es que el HTML se vea perfecto, es que el
usuario entienda la conexión y la seguridad.

## Ya construidos en esta carpeta

- `chat-widget.html` — el HTML del widget, con el header `X-Secret-Key` ya integrado en el
  `fetch`. Cada quien reemplaza `N8N_CHAT_URL` y `SECRET_KEY` con sus propios valores — nunca se
  pegan esos valores en el repo.
- `webhook-con-header-auth.json` — el flujo, con un nodo **Webhook normal** (no un Chat Trigger)
  configurado para `authentication: headerAuth`, más un nodo Set (`Preparar Input`) que extrae
  `chatInput`/`sessionId` del body, y un `Respond to Webhook` al final que devuelve JSON.

## El `path` del Webhook — cámbialo al importar

El nodo Webhook trae un `path` de ejemplo (`pruebawebhook-conectanet`). Al importar, cada quien
puede dejarlo así para probar rápido o cambiarlo por algo propio — es un campo de texto libre en la
pestaña principal del nodo, no hace falta editar el JSON a mano.

## Fase 1 — Ajustar el HTML a los datos reales del usuario

Activa el flujo (o usa la URL de prueba) para obtener la URL real del Webhook, y actualiza
`N8N_CHAT_URL` y `SECRET_KEY` en `chat-widget.html` con esa URL y la clave que definas.

## Fase 2 — Importar y configurar el workflow con Header Auth real

Importa `webhook-con-header-auth.json`. En el nodo Webhook, pestaña Authentication, confirma que
está en `Header Auth` y configura la credencial con el mismo valor de clave que pusiste en el
HTML — **nunca un nodo `IF` comparando la clave** (ver la corrección de seguridad en `PROMPT.md`
de la raíz del repo, ya se probó que ese patrón falla).

## Fase 3 — Probar el antes/después

1. Prueba el widget con la clave correcta puesta en el header — debe responder normal.
2. Cambia la clave a propósito en el HTML (déjala mal) — el webhook debe rechazar con un error,
   nunca llegar al AI Agent. Repórtalo como `Verificado` solo si viste ambos casos con evidencia.

## Si el usuario no tiene navegador gráfico (servidor headless)

Salta la Fase 1 y 3 con navegador. En vez de eso, conecta Hermes (vía MCP) directo a la URL
pública del túnel de n8n del Día 4, y prueba desde el chat de Hermes mismo o desde el Dashboard.

## Prompts de prueba

```text
Lee mini-proyecto-2. No tengo un HTML de partida — constrúyeme uno simple que
mande mensajes al Webhook de mi n8n. Muéstramelo antes de guardarlo.
```

```text
Configura Header Auth real en el nodo Webhook de mi flujo de consulta —
nunca un nodo IF comparando la clave, eso ya se probó que falla. Ayúdame a
generar la clave secreta y ponla solo en la credencial de n8n, no en ningún
archivo del repo.
```

```text
Prueba mi widget con la clave correcta, y después con una clave incorrecta a
propósito. Confírmame con evidencia real que la segunda vez se rechaza antes
de llegar al agente.
```
