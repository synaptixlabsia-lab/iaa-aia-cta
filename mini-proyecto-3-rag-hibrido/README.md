# Mini-proyecto 3 — RAG híbrido (búsqueda exacta + vectorial)

**Qué problema resuelve, en una frase:** el RAG del Día 4 solo busca "por significado" y a veces
falla con cosas literales (un código de plan, un nombre exacto de política) — este mini-proyecto
agrega un primer intento de búsqueda por texto exacto, y solo si eso no encuentra nada, cae a la
búsqueda por significado de siempre.

**Cómo se ve que funciona (la respuesta en Telegram se ve igual en ambos casos, así que hay que
mirar la ejecución):** pregunta algo con una palabra exacta del documento, abre la ejecución en
n8n (ícono de reloj) y confirma que el nodo "Buscar coincidencia exacta" ya trajo resultados —
el agente ni llega a usar la herramienta vectorial. Después pregunta lo mismo pero parafraseado:
ese nodo debe volver vacío, y ahí sí se activa la búsqueda vectorial. Esa comparación es la
prueba de que el patrón híbrido está funcionando, no solo la respuesta final.

**Estado: en construcción / el más avanzado del día.** No pasa nada si no lo terminas — el
objetivo es entender el patrón, no que quede 100% funcionando.

## La idea

```text
Pregunta del cliente
   → Búsqueda EXACTA primero (nodo Supabase nativo, filtro ILIKE sobre `documents`)
       ├── ¿Encontró algo? → usa eso, responde con precisión
       └── ¿No encontró nada? → cae a la búsqueda VECTORIAL (la del Día 4)
```

## Qué trae esta carpeta

- `rag-hibrido-exacta-vectorial.json` — el flujo que intenta exacta primero, vectorial de
  respaldo. **No requiere crear ninguna función SQL nueva** — la búsqueda exacta usa el nodo
  **Supabase nativo de n8n** (credencial `supabaseApi`, la misma del Día 4), con la operación
  "Get Many Rows" y un filtro `content ILIKE '%texto%'` directamente sobre la tabla `documents`
  ya creada en el Día 4.

## Por qué se simplificó (ya no hay `search_exact.sql`)

La primera versión de este mini-proyecto creaba una función SQL personalizada
(`search_exact`) y la llamaba por HTTP con una credencial Header Auth genérica manual — dos
piezas extra que complicaban el setup sin aportar nada que el nodo Supabase nativo no resuelva
solo. Con el nodo nativo y su filtro `ilike`, el mismo patrón de búsqueda exacta se logra sin
crear nada en la base de datos y sin manejar la `service_role key` a mano.

**⚠️ Verificar al importar**: la forma exacta de configurar el filtro (`ilike` sobre la columna
`content`) puede verse distinto según la versión de n8n instalada — el JSON trae el filtro
preconfigurado, pero si al importar no aparece igual, se arma manualmente en la sección Filters
del nodo "Buscar coincidencia exacta".
