# PROMPT — Mini-proyecto 2: widget web seguro

Lee `README.md` de esta carpeta primero. A diferencia del mini-proyecto 1, aquí sí vas a construir
cosas nuevas — con vibe coding en vivo. El foco no es que el HTML se vea perfecto, es que el
usuario entienda la conexión y la seguridad.

## Ya construidos en esta carpeta

- `chat-widget.html` — el HTML del widget, con el header `X-Secret-Key` ya integrado en el
  `fetch`. Cada quien reemplaza `N8N_CHAT_URL` y `SECRET_KEY` con sus propios valores — nunca se
  pegan esos valores en el repo.
- `webhook-con-header-auth.json` — el flujo, con el nodo Chat Trigger configurado para
  `authentication: headerAuth`.

## ⚠️ Verificar al importar — punto no confirmado

No está verificado si la versión de Chat Trigger instalada soporta `Header Auth` nativo igual que
un Webhook normal (el langchain Chat Trigger es más nuevo y puede tener menos opciones de
autenticación que el Webhook base de n8n). **Antes de prometerle al grupo que funciona, ábrelo y
confirma en la pestaña Authentication del nodo qué opciones aparecen de verdad.** Si Header Auth
no está disponible ahí, la alternativa validada es: usar un nodo **Webhook normal** (no Chat
Trigger) con Header Auth, y dentro del flujo llamar al AI Agent mediante un sub-workflow o
armando el mismo patrón de agente manualmente — repórtalo como `Bloqueado` con la razón exacta si
no puedes armarlo, no fuerces algo que no confirmaste.

## Fase 1 — Ajustar el HTML a los datos reales del usuario

Pide la URL real del Chat Trigger (Producción, no la de prueba) y la clave secreta que va a usar,
y actualiza `N8N_CHAT_URL` y `SECRET_KEY` en `chat-widget.html`.

## Fase 2 — Importar y configurar el workflow con Header Auth real

Importa `webhook-con-header-auth.json`. En el nodo Chat Trigger, sigue la verificación de arriba
antes de nada. Configura la credencial Header Auth con el mismo valor de clave que pusiste en el
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
mande mensajes al Chat Trigger de mi n8n. Muéstramelo antes de guardarlo.
```

```text
Configura Header Auth real en el nodo Chat Trigger de mi flujo de consulta —
nunca un nodo IF comparando la clave, eso ya se probó que falla. Ayúdame a
generar la clave secreta y ponla solo en la credencial de n8n, no en ningún
archivo del repo.
```

```text
Prueba mi widget con la clave correcta, y después con una clave incorrecta a
propósito. Confírmame con evidencia real que la segunda vez se rechaza antes
de llegar al agente.
```
