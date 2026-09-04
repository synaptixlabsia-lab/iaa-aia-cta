# Mini-proyecto 4 — Notion como baúl de información, conectado con Hermes

No es una base de datos de negocio (esa es Supabase, del Día 4) — es un lugar compartible con tu
equipo donde quedan resúmenes, resultados y bitácora de lo que tu automatización hizo.

## Qué trae esta carpeta

- `guardar-en-notion-referencia.json` — un flujo de referencia que muestra cómo n8n mismo puede
  escribir en Notion (originalmente pensado para errores — se adapta en `PROMPT.md` para guardar
  resúmenes en vez de solo fallos).

## Las dos formas de hacerlo hoy

1. **Vía Hermes directo**: le pides a Hermes en el chat que resuma y guarde algo en tu Notion — si
   Notion está conectado como herramienta/MCP de Hermes, lo hace sin que armes ningún flujo de
   n8n.
2. **Vía n8n** (usando el flujo de referencia): útil si quieres que sea n8n, no Hermes, quien
   escriba automáticamente en Notion cada vez que pase algo específico.

## Tres ejemplos concretos para probar en vivo (no solo el concepto)

**A. Resumen diario de conversaciones** — Hermes lee el historial de Telegram del día y arma una
página en Notion: cuántas preguntas llegaron, cuáles fueron, si alguna quedó sin responder.

**B. Reporte técnico de ejecuciones de n8n** — Hermes consulta (vía MCP, `hermes config set
N8N_API_KEY`) el historial de ejecuciones de n8n y arma un reporte más técnico: cuántas veces
corrió cada flujo, cuáles fallaron. Conecta con los perfiles default/técnico del Bloque 1 — el
reporte A es para el perfil default, el B para el técnico.

**C. Investigación de mercado, con dos caminos de entrega distintos** — el ejemplo más completo:
le pides a Hermes "hazme una investigación de mercado general sobre [tema del caso de negocio]".
Una vez tiene el contenido, pruébalo entregado de **dos formas**, para que la clase vea la
diferencia:
   - **Camino 1 — vía n8n**: Hermes manda el contenido a un webhook de n8n (usando MCP hacia n8n),
     y es n8n quien lo escribe en Notion — útil si quieres que quede registrado también en tu
     sistema de automatización, no solo en Hermes.
   - **Camino 2 — vía MCP directo**: Hermes escribe directo en Notion usando su propia herramienta
     de Notion, sin pasar por n8n — más simple, menos pasos, pero no queda registro en n8n.

Ninguno de los dos caminos es "el correcto" — la clase debe entender que es una decisión de
arquitectura (¿quieres que n8n sepa que esto pasó, o te basta con que quede en Notion?), no una
limitación técnica.
