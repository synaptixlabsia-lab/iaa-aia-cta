-- Búsqueda exacta — complementa a match_documents (búsqueda vectorial) del Día 4.
-- Corre esto en el SQL Editor de Supabase, en el mismo proyecto donde ya tienes la tabla `documents`.

-- Versión simple (ILIKE) — fácil de explicar en clase, busca coincidencia parcial de texto.
create or replace function search_exact (
  search_text text,
  match_count int default 5
) returns table (
  id bigint,
  content text,
  metadata jsonb
)
language plpgsql
as $$
begin
  return query
  select
    documents.id,
    documents.content,
    documents.metadata
  from documents
  where documents.content ilike '%' || search_text || '%'
  limit match_count;
end;
$$;

-- Prueba rápida, para correr después de crear la función:
-- select * from search_exact('nombre exacto que sepas que está en tu documento');

-- Nota para quien quiera ir más allá (no obligatorio hoy):
-- Una versión más precisa usaría full-text search real de Postgres (to_tsvector/plainto_tsquery
-- + un índice GIN), que puntúa relevancia en vez de solo "contiene o no contiene". Se deja como
-- mejora futura — la versión ILIKE de arriba ya demuestra el patrón completo.
