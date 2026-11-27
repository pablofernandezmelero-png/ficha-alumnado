#!/usr/bin/env bash
# Copia externa de la base de datos de las fichas. Se ejecuta en un ordenador de confianza, NUNCA en el repositorio.
# Requisitos: pg_dump 15+ y (recomendado) age o gpg para cifrar el resultado.
# Uso:  export SUPABASE_DB_URL='postgresql://postgres:<CONTRASEÑA>@db.<ref>.supabase.co:5432/postgres'
#       ./copia_externa.sh [carpeta_destino]
# La contraseña está en Supabase > Project Settings > Database. No la guardes en ningún fichero del repositorio.
set -euo pipefail
: "${SUPABASE_DB_URL:?Falta la variable SUPABASE_DB_URL}"
DEST="${1:-./copias_locales}"; STAMP="$(date +%Y%m%d-%H%M%S)"; OUT="$DEST/fichas-$STAMP"
mkdir -p "$OUT"; umask 077
# 1) Estructura + datos de los esquemas de la aplicación (incluye private.medios_claves: son las claves de los vídeos)
pg_dump "$SUPABASE_DB_URL" --no-owner --no-privileges --schema=public --schema=private --schema=backup -Fc -f "$OUT/aplicacion.dump"
# 2) Cuentas de alumnado y profesorado (datos de acceso)
pg_dump "$SUPABASE_DB_URL" --no-owner --no-privileges --data-only --table=auth.users --table=auth.identities -Fc -f "$OUT/auth.dump"
# 3) Estructura sola (para revisar cambios y reconstruir políticas y funciones)
pg_dump "$SUPABASE_DB_URL" --no-owner --schema-only --schema=public --schema=private -f "$OUT/estructura.sql"
# 4) Recuento de filas por tabla (para comprobar la integridad al restaurar)
psql "$SUPABASE_DB_URL" -At -F '|' -c "select 'public.'||relname, n_live_tup from pg_stat_user_tables where schemaname='public' order by 1" > "$OUT/recuento_filas.txt" || true
for t in clases fichas apartados perfiles telemetria xp_diario xp_estado events submissions; do
  echo "$t|$(psql "$SUPABASE_DB_URL" -At -c "select count(*) from public.$t")"; done > "$OUT/recuento_exacto.txt"
( cd "$OUT" && sha256sum aplicacion.dump auth.dump estructura.sql recuento_exacto.txt > SHA256SUMS )
echo "Copia creada en $OUT"
echo "IMPORTANTE: contiene claves y datos personales. Cífrala antes de subirla a ningún sitio:"
echo "  tar -C $DEST -cf - fichas-$STAMP | age -p > fichas-$STAMP.tar.age     (o: gpg -c)"
