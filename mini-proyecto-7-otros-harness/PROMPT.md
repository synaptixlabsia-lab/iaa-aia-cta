# PROMPT — Mini-proyecto 7: Otros harness + Artificial Analysis

Lee `README.md` primero. A diferencia de los otros mini-proyectos, aquí el "agente" que lee esto
(Hermes, Claude Code, o el que sea) no ejecuta todo solo — coordina una comparación entre
herramientas distintas, algunas de las cuales corren fuera de este chat.

## Fase 1 — Preparar los 3 archivos de configuración

Los archivos de ejemplo ya están en `configs/` con las mismas 4 reglas del caso ISP. Pregúntale al
usuario si quiere usarlos tal cual o ajustarlos a su caso real antes de empezar — no los cambies
sin confirmar, son el punto de comparación.

## Fase 2 — Correr la misma instrucción en cada herramienta

El usuario necesita tener acceso real a Claude Code, Cursor y ChatGPT para esta fase — tú (el
harness que está leyendo esto ahora) puedes ser uno de los tres si ya eres Claude Code, pero no
puedes ejecutar Cursor o ChatGPT por el usuario. Guíalo:

1. Confirma que cada herramienta tiene su archivo de reglas correspondiente puesto donde va
   (tabla en `README.md`).
2. Dale la misma instrucción ambigua a las tres: *"agrega autenticación al webhook de consultas"*.
3. Pídele que te pegue o resuma lo que respondió cada una.

## Fase 3 — Armar la tabla comparativa

Con lo que el usuario reporte, arma la tabla: Harness | Respetó la regla | La mencionó
explícitamente | Observación. No inventes resultados que el usuario no confirmó — si solo probó
2 de los 3, la tabla tiene 2 filas, no 3 con una inventada.

## Fase 4 — Artificial Analysis, si el usuario quiere ir más allá

Si el usuario pregunta por costo/velocidad/capacidades de agentes (no solo modelos sueltos),
dirígelo a la sección de agentes de Artificial Analysis en vez de inventar números de precio o
benchmarks — esos cambian seguido y no deben citarse de memoria:

- [artificialanalysis.ai/agents](https://artificialanalysis.ai/agents) — comparación general de
  agentes de trabajo.
- [artificialanalysis.ai/agents/coding-agents](https://artificialanalysis.ai/agents/coding-agents)
  — la más relevante para este mini-proyecto (Claude Code, Cursor, etc.).
- [artificialanalysis.ai/agents/presentations](https://artificialanalysis.ai/agents/presentations)
  y [artificialanalysis.ai/agents/ocr](https://artificialanalysis.ai/agents/ocr) — si el caso de
  uso del usuario toca esas categorías.

## Prompts de prueba

```text
Lee mini-proyecto-7. Ayúdame a poner el archivo de reglas correcto en cada
herramienta (Claude Code, Cursor, ChatGPT) usando los ejemplos de configs/.
```

```text
Le voy a dar la misma instrucción ambigua a las 3 herramientas. Ayúdame a
armar la tabla comparativa con lo que cada una responda — no inventes
resultados de las que no he probado todavía.
```

```text
Explícame qué mirar en Artificial Analysis si voy a automatizar mil
respuestas diarias para mi ISP — no me des números de memoria, dime qué
columnas de esa página revisar.
```
