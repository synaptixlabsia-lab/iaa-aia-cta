# Mini-proyecto 6 — Flota de agentes, con Bot Mode nativo de Hermes

**No se construye un router manual** — Hermes ya trae esto integrado. Bot Mode convierte tus
perfiles en un roster de bots nombrados que se comunican entre sí vía `@mentions` y
`message_agent`, cada uno con su propio rol/modelo/memoria/habilidades. Viene activado por
defecto en el Desktop (se desactiva en Configuración → Complementos → Bots). En headless (Docker +
Dashboard, sin app gráfica) se usa igual por CLI: `hermes -p <bot> chat`.

Este es el bloque de integración final — junta todo lo del día en el proyecto real de cada quien.

## Cómo se conecta (visual)

```text
Cliente escribe (Telegram / widget web)
   ▼
Bot "router" (perfil default) — SOLO clasifica y decide, nunca responde el contenido final
   ├── @mention → Bot "soporte técnico" — usa tu RAG (mini-proyecto 1 o 3)
   ├── @mention → Bot "facturación" — usa Notion (mini-proyecto 4) si aplica
   └── @mention → Bot "general" — responde directo, sin herramientas extra
   ▼
El bot que recibió el @mention responde al cliente — el router nunca contesta él mismo
```

## Cómo probarlo

1. Define con tu propio caso (o ConectaNet) 2-3 roles distintos y crea/reutiliza esos perfiles.
2. Confirma que Bot Mode está activo.
3. Simula un mensaje real y **observa el traspaso ocurrir** — no basta con que los bots existan
   configurados, la prueba es ver el `@mention`/`message_agent` pasar la conversación de verdad.
4. Repórtalo `Verificado` solo con esa evidencia (ver `PROMPT.md` de esta carpeta para los prompts
   ya armados que se lo piden a Hermes paso a paso).
