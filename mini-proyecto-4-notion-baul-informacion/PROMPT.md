# PROMPT — Mini-proyecto 4: Notion como baúl de información

Lee `README.md` primero. Antes de construir nada, deja clara la distinción con el usuario si
parece confundido: Supabase (Día 4) guarda datos del negocio, consultados por el RAG. Notion (hoy)
guarda lo que el propio proyecto produce — resúmenes, resultados, bitácora — para que un humano lo
revise sin abrir n8n ni Supabase.

## Camino A — Vía Hermes directo (empieza por aquí)

Pregunta si el usuario ya tiene Notion conectado como herramienta de Hermes. Si no, guíalo a
conectarlo (Hermes trae integración nativa con Notion — revisa en su configuración de
herramientas/MCP). Una vez conectado, pídele que pruebe con un mensaje como:

```text
Resume mi conversación de hoy en Telegram y guárdala como una página nueva en
mi base de Notion, con título, fecha y el resumen.
```

Verifica junto al usuario que la página apareció en Notion antes de reportarlo `Verificado`.

## Camino B — Vía n8n (si el usuario prefiere que n8n escriba directo)

Antes de importar `guardar-en-notion-referencia.json`, asegúrate de que el usuario ya creó la
base de datos en Notion con las 5 propiedades exactas de `README.md` (Fecha, Tipo, Resumen,
Origen, Preguntas sin responder) — el flujo las busca por esos nombres exactos.

El flujo ya viene con datos de ejemplo reales en el nodo "Preparar resumen" (Code) — pruébalo tal
cual primero con "Execute workflow" para confirmar que la página aparece en Notion con todos los
campos llenos, **antes** de conectarlo a un trigger real (Telegram, Schedule, o el resultado de
Hermes). Solo después de esa prueba, reemplaza el nodo "Ejecutar manualmente" por el trigger que
corresponda al ejemplo (A, B o C de abajo).

**Advertencia**: el nodo Notion está marcado `VERIFICAR AL IMPORTAR` porque cada base de Notion
puede tener el `databaseId` distinto — pide al usuario el ID de su base real (Compartir → Copiar
enlace, el ID va en la URL) y actualiza el nodo antes de ejecutar.

## Fase 3 — Los tres ejemplos, uno por uno

**A. Resumen diario**: resume las conversaciones de Telegram del día y guárdalas como página en
Notion (título, fecha, número de preguntas, si alguna quedó sin responder).

**B. Reporte técnico**: consulta el historial de ejecuciones de n8n vía MCP y arma un reporte
distinto — más técnico, para el perfil "técnico" del Bloque 1, no para el default.

**C. Investigación de mercado, dos caminos**: genera una investigación de mercado sobre el caso de
negocio del usuario. Pregúntale cuál camino de entrega quiere probar primero:
   - Camino 1: manda el contenido a n8n (vía MCP hacia n8n) y deja que n8n lo escriba en Notion.
   - Camino 2: lo escribes tú mismo directo en Notion, sin pasar por n8n.

Después de probar uno, pregunta si quiere ver el otro también — la clase debe ver ambos para
entender que es una decisión de arquitectura, no que uno sea "el correcto".

## Prompts de prueba

```text
Ayúdame a conectar Notion como herramienta de Hermes, y después pídeme que
pruebe guardando un resumen de ejemplo.
```

```text
Resume mis conversaciones de Telegram de hoy y guárdalas en Notion. Después,
hazme un reporte técnico distinto con el historial de ejecuciones de mi n8n
(usa la API key que ya configuramos).
```

```text
Investiga el mercado de [mi caso de negocio] y muéstrame el resultado.
Después, entrégamelo primero vía n8n a Notion, y después vía tu propia
herramienta de Notion directo — quiero ver los dos caminos.
```
