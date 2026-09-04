# Mini-proyecto 7 — Otros harness (Claude Code, Cursor, ChatGPT) + Artificial Analysis

**Qué hace esto, en una frase:** todos los harness de código (Hermes incluido) funcionan igual en
el fondo — un modelo + un archivo de reglas que le dice cómo comportarse en TU proyecto. Aquí se
prueba ese mismo patrón en 3 herramientas distintas a las de hoy, usando el mismo caso ISP, para
ver qué tan bien cada una respeta sus propias reglas.

## Los 3 archivos de configuración de esta carpeta

| Harness | Archivo de reglas | Dónde vive |
|---|---|---|
| **Claude Code** | `configs/CLAUDE.md` | raíz del proyecto (o `~/.claude/CLAUDE.md` para reglas globales) |
| **Cursor** | `configs/cursor-rules.mdc` | `.cursor/rules/` dentro del proyecto (formato moderno `.mdc`; el viejo `.cursorrules` en la raíz todavía funciona pero está en desuso — si tienen los dos, `.mdc` gana y el otro se ignora sin avisar) |
| **ChatGPT como agente de código** | `configs/chatgpt-system-prompt.md` | se pega como mensaje de sistema/instrucciones personalizadas — ChatGPT no lee un archivo del proyecto solo, hay que dárselo a mano o vía su modo "Projects" |

Los tres archivos de ejemplo aquí tienen **las mismas 4 reglas del caso ISP** (nunca inventar
datos de clientes, siempre Header Auth y nunca un IF comparando claves, avisar antes de tocar
credenciales, y preguntar antes de hacer push) — para que la comparación sea justa: mismo
contenido, tres formatos distintos.

## El ejercicio — qué se prueba de verdad

1. Abre el mismo proyecto (o uno de prueba) en cada herramienta, con su archivo de reglas puesto.
2. Dale la misma instrucción ambigua a los tres, algo como: *"agrega autenticación al webhook de
   consultas"* — sin decirle cómo. La regla del archivo dice explícitamente que no use un nodo IF.
3. Compara: ¿la herramienta respetó la regla sin que se lo repitieras? ¿la mencionó explícitamente
   ("según tus reglas, voy a usar Header Auth...")? ¿la ignoró?
4. Reporta como tabla: Harness | Respetó la regla | La mencionó explícitamente | Observación.

**No hay una respuesta "correcta" — el punto es que la clase vea con sus propios ojos que un
archivo de reglas bien escrito cambia el comportamiento real, y que no todos los harness lo
respetan con la misma consistencia.**

## Artificial Analysis — la comparación de agentes, no solo de modelos

Además de comparar los 3 harness entre sí, Artificial Analysis tiene una sección específica de
**agentes** (no solo modelos sueltos) — más relevante para hoy que la tabla general de modelos:

- **[artificialanalysis.ai/agents](https://artificialanalysis.ai/agents)** — comparación general
  de agentes de trabajo: disponibilidad por plataforma (Web/Mac/Windows/Linux), si son open-source,
  si dejan elegir el modelo por debajo, acceso a archivos locales, automatización de navegador, y
  precio — categorías que incluyen Coding Agents, Presentaciones, OCR, Análisis de datos y
  Atención al cliente.
- **[artificialanalysis.ai/agents/coding-agents](https://artificialanalysis.ai/agents/coding-agents)**
  — la más directamente relevante para este mini-proyecto: compara Claude Code, Cursor y otros
  agentes de código entre sí, con las mismas categorías de arriba.
- **[artificialanalysis.ai/agents/presentations](https://artificialanalysis.ai/agents/presentations)**
  — relevante si conectan generación de diapositivas/reportes visuales a su flujo.
- **[artificialanalysis.ai/agents/ocr](https://artificialanalysis.ai/agents/ocr)** — relevante si
  el caso ISP necesita leer documentos escaneados (contratos, facturas) antes de meterlos al RAG.

Para el caso ISP: si van a automatizar algo con volumen alto (por ejemplo, generar mil respuestas
al día), el costo y la velocidad importan tanto como la calidad — comparen en estas páginas antes
de elegir qué herramienta o modelo conectar en n8n o en el harness que usen, en vez de asumir
"cuál es mejor" de memoria.
