# PROMPT — Mini-proyecto 6: flota de agentes (Bot Mode)

Lee `README.md` primero. Este es el cierre del día — usa todo lo construido en los mini-proyectos
1 a 5, no inventes algo aparte.

## Fase 1 — Definir los roles con el usuario

Antes de tocar nada, pregúntale al usuario qué caso de negocio quiere resolver hoy (el propio, o
uno inventado tipo ConectaNet) y qué 2-3 roles distintos necesitaría — ejemplo: un bot de soporte
técnico, un bot de facturación, un bot general que decide a cuál pasar la conversación.

## Fase 2 — Crear los perfiles (si no existen ya)

Usa los perfiles del mini-proyecto 1 de este mismo laboratorio (default/técnico) como base, o
crea nuevos si el caso de negocio del usuario los necesita — siempre pidiéndolo tú mismo (no le
dictes comandos), como ya se estableció en el `PROMPT.md` raíz.

## Fase 3 — Activar Bot Mode y configurar los bots

Confirma que Bot Mode está activo. Configura cada bot con su rol, y verifica que cada uno tiene
acceso a las herramientas que necesita — el bot de soporte técnico necesita el RAG (mini-proyecto
1 o 3), el que decide a quién pasar la conversación necesita poder usar `@mentions`.

## Fase 4 — Probar la conversación entre bots

Simula un mensaje de cliente y observa cómo un bot le pasa el control a otro vía `@mentions` o
`message_agent`. Repórtalo `Verificado` solo si viste el traspaso ocurrir de verdad, no solo
porque los bots existen configurados.

## Prompts de prueba

```text
Quiero armar una flota de 3 bots para mi proyecto: uno de soporte técnico
(usando mi RAG), uno de facturación, y uno router que decida a cuál pasar
cada mensaje. Ayúdame paso a paso, empezando por confirmar que Bot Mode
está activo.
```

```text
Simula que un cliente escribe preguntando por su factura. Muéstrame cómo el
bot router lo detecta y le pasa la conversación al bot de facturación.
```
