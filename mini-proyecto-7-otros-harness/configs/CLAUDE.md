# Reglas del proyecto ConectaNet (ejemplo — Claude Code)

Este archivo vive en la raíz del proyecto (o en `~/.claude/CLAUDE.md` para reglas globales de
todos tus proyectos). Claude Code lo lee automáticamente al iniciar sesión en esta carpeta.

## Reglas obligatorias

1. **Nunca inventes datos de clientes.** Si necesitas un ejemplo, usa datos claramente ficticios
   marcados como tal ("Cliente de ejemplo", no un nombre real).
2. **Nunca uses un nodo `IF` comparando una clave secreta para autenticar un webhook.** Ese patrón
   ya se probó y falla en rechazar tokens inválidos de forma confiable. Usa Header Auth nativo de
   n8n, configurado en la pestaña Authentication del nodo Webhook.
3. **Avisa antes de tocar cualquier credencial, API key o archivo `.env`.** Nunca las muestres en
   texto plano en tu respuesta, ni las escribas directamente en un archivo del repo.
4. **Pregunta antes de hacer `git push` o publicar cualquier cosa.** Un commit local está bien;
   publicarlo requiere confirmación explícita.
