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

`guardar-en-notion-referencia.json` está pensado originalmente para errores (dispara con un Error
Trigger). Para este mini-proyecto, adáptalo: cambia el trigger por el que corresponda (puede ser
el mismo flujo de consulta del mini-proyecto 1, agregando un paso al final que escriba en Notion
cada vez que responde), y ajusta las propiedades del nodo Notion a las columnas reales de la base
de Notion del usuario — no asumas nombres de columna, pregúntale cuáles tiene.

**Advertencia**: el nodo Notion de este archivo está marcado `VERIFICAR AL IMPORTAR` porque nunca
se probó contra una base de Notion real — las propiedades exactas (`rich_text`, `date`, etc.)
pueden no coincidir con la versión de n8n instalada. Ajusta contra la base real del usuario, no
copies el archivo tal cual.

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
