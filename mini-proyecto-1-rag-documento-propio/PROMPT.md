# PROMPT — Mini-proyecto 1: RAG con documento propio

Lee `README.md` de esta carpeta primero. Los 3 workflows de esta carpeta ya están construidos y
probados — tu trabajo es importarlos en el n8n del usuario y adaptarlos a sus credenciales, no
inventar workflows nuevos.

## Fase 1 — Verificación

Confirma con el usuario (o revisando) que:
- n8n del Día 4 sigue corriendo (`docker ps`).
- La tabla `documents` en Supabase existe.

Repórtalo como `Verificado` o `Bloqueado` antes de seguir.

## Fase 2 — Importar

Guía al usuario a importar `ingesta-pdf-telegram-supabase.json` en n8n (`Import from File`). Los
nodos marcados `VERIFICAR AL IMPORTAR` necesitan que seleccione o cree su credencial real — no
inventes valores, dile exactamente en qué nodo y qué campo.

## Fase 3 — Probar la ingesta

Pide al usuario un PDF real. Actíva el workflow, pídele que se lo mande al bot de Telegram, y
confirma con él que llegó la respuesta de confirmación. Repórtalo `Verificado` solo si el usuario
confirma con evidencia (captura o descripción de la respuesta real).

## Fase 4 — Importar y probar la consulta

Importa `consulta-telegram-supabase.json` (o `consulta-con-guardrails.json` si el usuario quiere
la versión con Guardrails). Sugiere al usuario 3 preguntas que el documento sí debería responder y
1 que no — para confirmar que no inventa respuestas.

## Prompts de prueba

```text
Lee el README y el PROMPT de mini-proyecto-1. Verifica que mi n8n y mi tabla
documents siguen activos, y dime el estado antes de tocar nada.
```

```text
Importa ingesta-pdf-telegram-supabase.json en mi n8n. Dime exactamente en qué
nodos necesito seleccionar mis credenciales.
```

```text
Ya subí un PDF de prueba por Telegram. Ayúdame a confirmar en Supabase que la
tabla documents tiene filas nuevas antes de seguir con la consulta.
```
