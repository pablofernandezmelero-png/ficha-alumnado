#!/usr/bin/env bash
# Comprueba una copia creada por copia_externa.sh: huellas, legibilidad y recuento. No necesita acceso a producción.
# Uso: ./verificar_copia.sh carpeta_de_la_copia
set -euo pipefail
D="${1:?Indica la carpeta de la copia}"; cd "$D"
sha256sum --check SHA256SUMS
pg_restore --list aplicacion.dump > /dev/null && echo "aplicacion.dump legible"
pg_restore --list auth.dump > /dev/null && echo "auth.dump legible"
for t in perfiles xp_diario clases; do pg_restore --list aplicacion.dump | grep -q " TABLE DATA public $t " && echo "contiene datos de $t" || { echo "FALTA $t"; exit 1; }; done
pg_restore --list aplicacion.dump | grep -q "medios_claves" && echo "contiene las claves de los medios" || { echo "FALTAN las claves de los medios"; exit 1; }
echo "Copia verificada. Recuento en el momento de la copia:"; cat recuento_exacto.txt
