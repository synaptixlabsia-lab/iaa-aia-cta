# PROMPT — Mini-proyecto 3: RAG híbrido

Lee `README.md` primero. Este es el mini-proyecto más avanzado del día — dile al usuario desde el
inicio que no pasa nada si no lo termina, el objetivo es entender el patrón.

## Fase 1 — Importar el workflow

Importa `rag-hibrido-exacta-vectorial.json`. El nodo "Buscar coincidencia exacta VERIFICAR AL
IMPORTAR" usa la credencial **Supabase nativa** (`supabaseApi`) — la misma que ya está configurada
del Día 4, no hay que crear ninguna credencial nueva ni pegar ninguna `service_role key`. Solo hay
que apuntarla a la credencial Supabase real del usuario.

**Verifica al importar** que el filtro del nodo (columna `content`, condición `ilike`) aparezca
correctamente en la sección Filters — si la versión de n8n del usuario lo muestra distinto,
ayúdalo a armarlo ahí mismo: campo `content`, operador "contiene" o `ilike`, valor
`%{{ texto de la pregunta }}%`.

## Fase 2 — Probar los dos caminos

1. Pregunta algo que sepas que coincide literalmente con una palabra del documento — debe
   responder rápido, vía la búsqueda exacta.
2. Pregunta algo con las palabras cambiadas pero mismo significado — debe caer a la búsqueda
   vectorial y responder igual de bien.

Reporta cada camino como `Verificado` solo si viste ambas respuestas funcionar.

## Prompts de prueba

```text
Lee mini-proyecto-3. Ayúdame a importar rag-hibrido-exacta-vectorial.json y a
apuntar el nodo de búsqueda exacta a mi credencial Supabase real — no necesito
crear ninguna función SQL nueva para esto.
```

```text
Confirma en el nodo "Buscar coincidencia exacta" que el filtro está configurado
sobre la columna content con ilike. Si no aparece así, ayúdame a configurarlo
manualmente en la sección Filters del nodo.
```

```text
Prueba mi RAG híbrido con una pregunta de coincidencia exacta y otra con
palabras distintas pero mismo significado. Confírmame que ambas funcionan
antes de darlo por terminado.
```
