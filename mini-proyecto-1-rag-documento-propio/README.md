# Mini-proyecto 1 — RAG con tu documento propio (ya construido, listo para importar)

Ingesta un PDF por Telegram, lo guarda en tu Supabase del Día 4, y responde preguntas sobre él —
con una versión adicional que agrega Guardrails.

## Cómo se conecta (visual)

```text
INGESTA (una sola vez por documento)
Telegram (subes tu PDF)
   → Telegram: descargar archivo
   → Extract from File (PDF a texto)
   → Text Splitter + Embeddings (Mistral)
   → Supabase Vector Store: Insertar → tabla `documents`

CONSULTA (cada vez que preguntas)
Telegram (tu pregunta)
   → AI Agent (con memoria de la conversación)
       ├── usa Supabase como herramienta (retrieve-as-tool)
       └── [opcional: consulta-con-guardrails.json añade un filtro ANTES del Agent]
   → Telegram: responde citando el documento, o dice "no sé" si no hay evidencia
```

## Qué trae esta carpeta

- `ingesta-pdf-telegram-supabase.json` — recibe un PDF por Telegram, lo fragmenta, genera
  embeddings, lo inserta en la tabla `documents`.
- `consulta-telegram-supabase.json` — responde preguntas por Telegram, con memoria por
  conversación.
- `consulta-con-guardrails.json` — la misma consulta, con Guardrails delante para bloquear intentos
  de manipulación.

## Antes de importar

- Tu n8n del Día 4 corriendo.
- Tu tabla `documents` de Supabase ya creada.
- Credenciales de Telegram y Mistral configuradas en tu instancia local (los nodos marcados
  `VERIFICAR AL IMPORTAR` te van a pedir seleccionarlas).

## Cómo probarlo

1. Importa `ingesta-pdf-telegram-supabase.json`, actívalo, mándale un PDF por Telegram.
2. Confirma en el dashboard de Supabase que la tabla `documents` tiene filas nuevas.
3. Importa `consulta-telegram-supabase.json` (o `consulta-con-guardrails.json` si quieres probar
   la versión protegida), actívalo, hazle 3 preguntas que sepas que el documento responde y 1 que
   sepas que no.
