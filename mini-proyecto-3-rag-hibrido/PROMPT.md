# PROMPT — Mini-proyecto 3: RAG híbrido

Lee `README.md` primero. Este es el mini-proyecto más avanzado del día — dile al usuario desde el
inicio que no pasa nada si no lo termina, el objetivo es entender el patrón.

## Fase 1 — Crear la función SQL

Guía al usuario a pegar `search_exact.sql` en el SQL Editor de su proyecto Supabase (el mismo del
Día 4, no uno nuevo) y ejecutarlo. Verifica con la consulta de prueba que trae el propio archivo.

## Fase 2 — Importar el workflow

Importa `rag-hibrido-exacta-vectorial.json`. El nodo "Buscar coincidencias exactas" necesita una
credencial de tipo **Header Auth genérico** (no Supabase nativo) con dos headers:
`apikey` y `Authorization: Bearer <service_role key>` — la `service_role key` la encuentra el
usuario en Supabase → Settings → API. **Nunca la pegues en el chat ni en un archivo — dile al
usuario exactamente dónde crear la credencial en n8n.**

También reemplaza `https://TU-PROYECTO.supabase.co` en la URL del nodo HTTP Request por la URL
real del proyecto del usuario.

## Fase 3 — Probar los dos caminos

1. Pregunta algo que sepas que coincide literalmente con una palabra del documento — debe
   responder rápido, vía la búsqueda exacta.
2. Pregunta algo con las palabras cambiadas pero mismo significado — debe caer a la búsqueda
   vectorial y responder igual de bien.

Reporta cada camino como `Verificado` solo si viste ambas respuestas funcionar.

## Prompts de prueba

```text
Lee mini-proyecto-3. Ayúdame a crear la función search_exact en mi Supabase del
Día 4 y a confirmar que corre bien con la consulta de prueba.
```

```text
Importa rag-hibrido-exacta-vectorial.json. Dime exactamente dónde en n8n creo
la credencial Header Auth con mi service_role key de Supabase — no me la pidas
pegada en el chat.
```

```text
Prueba mi RAG híbrido con una pregunta de coincidencia exacta y otra con
palabras distintas pero mismo significado. Confírmame que ambas funcionan
antes de darlo por terminado.
```
