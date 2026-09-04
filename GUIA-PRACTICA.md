# Guía práctica — Día 5 (cohorte 260831)

Da por hecho que ya tienes de ayer (Día 4): n8n corriendo local con Docker, el túnel público
funcionando, y tu RAG propio respondiendo sobre Supabase. Hoy no se repite nada de eso.

## 1. Levantar Hermes — Docker, el mismo que ya tienes de ayer

No hace falta instalar nada nuevo aparte de Docker (que ya funciona desde ayer). Un contenedor
más, no una herramienta distinta.

**Setup inicial:**

```bash
mkdir -p ~/.hermes
docker run -it --rm -v ~/.hermes:/opt/data nousresearch/hermes-agent setup
```

Este asistente pregunta por proveedor de modelo, backend, y plataforma de mensajería — se responde
sobre la marcha, no hay pantallas fijas que memorizar.

**Dejarlo corriendo con el Dashboard accesible por navegador:**

```bash
docker run -d --name hermes --restart unless-stopped \
  -v ~/.hermes:/opt/data \
  -p 9119:9119 \
  -e HERMES_DASHBOARD=1 -e HERMES_DASHBOARD_HOST=0.0.0.0 \
  nousresearch/hermes-agent gateway run
```

Entrar por navegador a `http://localhost:9119`. Si no tienes navegador gráfico (servidor Linux sin
GUI), el Dashboard también permite subir/descargar archivos directo desde ahí — no hace falta la
app Desktop.

## 2. Qué es un "gateway" — entiende esto antes de seguir

Un gateway de Hermes es una conexión directa al sistema de archivos de donde esté instalado. Si
corre en Docker, esa conexión queda contenida al contenedor — nunca toca tu sistema real. Eso es
justo por lo que usamos Docker: no porque el acceso amplio sea malo (es lo que hace útil a
Hermes), sino porque así sabes con certeza a qué exactamente tiene acceso.

## 3. Perfiles — default y técnico

No se escriben comandos a mano. Se le pide a Hermes, en el chat:

> "Crea un perfil nuevo llamado 'tecnico', clonado de mi perfil actual, y edítale el archivo
> SOUL.md para que actúe como el asistente técnico interno — puede citar nombres de nodos, tablas
> de Supabase e IDs de ejecución, a diferencia del perfil default que da respuestas simples de
> cara al cliente."

Prueba la misma pregunta con los dos perfiles y compara el tono de la respuesta.

## 4. Traer tu documento de prueba (opcional, si no tienes uno propio)

> "Clona el repositorio de este laboratorio dentro de tu carpeta de trabajo, y muéstrame qué
> archivos trae."

## 5. n8n conectado a una página HTML

Ve a `mini-proyecto-1-rag-documento-propio/` e importa `ingesta-pdf-telegram-supabase.json` y
`consulta-telegram-supabase.json` si todavía no tienes tu propio par ingesta/consulta corriendo.
Después, en `mini-proyecto-2-widget-web-seguro/`, importa `webhook-con-header-auth.json` — es un
nodo **Webhook normal** (no un Chat Trigger) con Header Auth, que expone tu flujo como endpoint:
cualquier HTML que le mande la clave correcta en el header habla con el mismo agente que responde
por Telegram. `chat-widget.html` ya trae el `fetch` armado, solo hay que pegar tu URL y tu clave.

Si no tienes navegador gráfico, salta este paso visual: conecta tu Hermes (vía MCP) directo a la
URL pública de tu túnel de n8n de ayer — mismo resultado, sin necesitar ver el HTML renderizado.

## 6. RAG híbrido (avanzado, opcional)

`mini-proyecto-3-rag-hibrido/rag-hibrido-exacta-vectorial.json` — búsqueda exacta primero (nodo
Supabase nativo con filtro ILIKE, sin crear ninguna función SQL nueva), vectorial de respaldo si
no encuentra nada. Es el mini-proyecto más avanzado del día, no pasa nada si no lo terminas.

## 7. Notion + Hermes

Pídele a Hermes que resuma tu conversación del día y la guarde como una página nueva en tu base de
Notion (ver `mini-proyecto-4-notion-baul-informacion/README.md` para la estructura exacta de la
base) — o usa `guardar-en-notion-referencia.json` de esa misma carpeta como flujo de referencia de
cómo n8n mismo puede escribir en Notion directamente, ya con datos de ejemplo reales.

## 8. Imágenes — el framework de 4 preguntas

Antes de pedir una imagen, responde: ¿qué es? ¿para qué se usa? ¿qué estilo? ¿qué debe evitar? Un
prompt armado así da resultados consistentemente mejores que uno vago.

## 9. Flota de agentes — Bot Mode

Activa Bot Mode en Hermes Desktop (viene activado por defecto). Configura 2-3 bots usando los
perfiles ya creados, cada uno con un rol distinto, y pruébalos hablándose entre sí vía `@mentions`.

## Checklist final del proyecto

```text
[ ] n8n local corriendo (o accesible por URL pública del túnel)
[ ] Al menos un canal de entrada funcionando (Telegram, HTML, o ambos)
[ ] RAG respondiendo con evidencia de tu documento propio
[ ] Al menos una integración adicional (Notion, imágenes, o multi-agente)
[ ] Puedes explicar en dos minutos qué problema real resuelve tu proyecto
```
