# Laboratorio Día 5 — cohorte 260831

Este repo es el que se comparte con los alumnos el Día 5. Está pensado para que, **incluso si en
clase no alcanzamos a probar todo en vivo, cada quien pueda seguir practicando por su cuenta** —
con n8n, con Hermes, o con ambos.

## Cómo se usa (para el alumno)

Ningún paso requiere Git instalado. Se descarga el ZIP de este repo desde GitHub (botón "Code" →
"Download ZIP"), se descomprime, y se sigue `GUIA-PRACTICA.md`.

Si tienen Hermes ya corriendo (ver `GUIA-PRACTICA.md`), también pueden pedirle directamente:

> "Clona el repositorio `<URL de este repo>` dentro de tu carpeta de trabajo, y muéstrame qué
> archivos trae."

## Qué hay adentro

Son **6 mini-proyectos independientes**, cada uno con su propio `README.md` (qué hace) y su propio
`PROMPT.md` (instrucciones detalladas, para dárselas a Hermes). Empieza por `PROMPT.md` en esta
misma carpeta — es el contexto maestro que Hermes debe leer primero.

```text
lab-dia-5/
  README.md                                  ← este archivo
  PROMPT.md                                  ← contexto maestro, léelo primero (dáselo a Hermes)
  GUIA-PRACTICA.md                           ← paso a paso narrativo del día completo

  mini-proyecto-1-rag-documento-propio/      ← ya construido y probado
  mini-proyecto-2-widget-web-seguro/         ← HTML + flujo con Header Auth real
  mini-proyecto-3-rag-hibrido/               ← búsqueda exacta + vectorial (avanzado, opcional)
  mini-proyecto-4-notion-baul-informacion/   ← Notion + Hermes
  mini-proyecto-5-generacion-imagenes/       ← framework de 4 preguntas, sin código
  mini-proyecto-6-flota-de-agentes/          ← Bot Mode nativo de Hermes, el cierre del día
```

## Regla de credenciales — importante

Ningún flujo de este repo trae credenciales reales. Los nodos que necesitan Telegram, Mistral o
Supabase están marcados `VERIFICAR AL IMPORTAR` — n8n les va a pedir seleccionar o crear su propia
credencial al importar. Nunca hay que pegar tokens ni API keys reales en un archivo de este repo.
