# Mini-proyecto 3 — RAG híbrido (búsqueda exacta + vectorial)

**Estado: en construcción / el más avanzado del día.** No pasa nada si no lo terminas — el
objetivo es entender el patrón, no que quede 100% funcionando.

## La idea

```text
Pregunta del cliente
   → Búsqueda EXACTA primero (función SQL de texto literal)
       ├── ¿Encontró algo? → usa eso, responde con precisión
       └── ¿No encontró nada? → cae a la búsqueda VECTORIAL (la del Día 4)
```

## Qué va a tener esta carpeta

- `search_exact.sql` — la función SQL de búsqueda exacta, complementa `match_documents`.
- `rag-hibrido-exacta-vectorial.json` — el flujo que intenta exacta primero, vectorial de
  respaldo.
