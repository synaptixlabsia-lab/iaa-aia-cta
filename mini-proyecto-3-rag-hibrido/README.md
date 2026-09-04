# Mini-proyecto 3 — RAG híbrido (búsqueda exacta + vectorial)

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
