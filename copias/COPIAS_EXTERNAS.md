# Copias de seguridad externas

La copia diaria de Supabase (`backup.hacer_copia()`, tarea `copia-diaria` a las 02:30 UTC) guarda 18 tablas dentro del **mismo proyecto**: protege de errores, no de perder el proyecto. Este procedimiento añade una copia fuera.

## Qué se copia
- Esquemas `public`, `private` y `backup` completos (tablas, datos, funciones, políticas). `private.medios_claves` contiene las **claves de vídeos y audios**: sin ellas el contenido cifrado del repositorio no se puede abrir.
- Cuentas de acceso (`auth.users`, `auth.identities`).
- Recuento de filas y huellas SHA-256 para comprobar la integridad.
- No se copia el contenido cifrado de los medios: ya está en el repositorio de GitHub. Los originales (mp3/mp4 sin cifrar) los conserva el cliente; si se pierden, hay que pedírselos de nuevo.

## Cómo hacerla (cada semana, y siempre antes de cambios grandes)
1. En un ordenador de confianza con `pg_dump` 15 o superior.
2. En Supabase: Project Settings → Database → copia la cadena de conexión y pon tu contraseña. No la guardes en ningún fichero.
3. `export SUPABASE_DB_URL='postgresql://postgres:<CONTRASEÑA>@db.<ref>.supabase.co:5432/postgres'`
4. `./copias/copia_externa.sh ~/copias_fichas`
5. `./copias/verificar_copia.sh ~/copias_fichas/fichas-<fecha>`
6. **Cifra** la carpeta antes de guardarla fuera (contiene claves y datos personales): `tar -cf - fichas-<fecha> | age -p > fichas-<fecha>.tar.age` (o `gpg -c`). Guarda el fichero cifrado en un disco externo o en un almacenamiento en la nube de la organización. La contraseña de cifrado va en un gestor de contraseñas, no junto al fichero.
7. Conserva al menos las últimas 4 copias semanales. No borres las copias internas de Supabase.

## Cómo restaurar
1. Crea un proyecto Supabase nuevo (o usa uno vacío de pruebas).
2. Descifra y descomprime la copia; ejecuta `./copias/verificar_copia.sh <carpeta>`.
3. `pg_restore --no-owner --clean --if-exists -d "$NUEVA_DB_URL" aplicacion.dump`
4. `pg_restore --no-owner --data-only -d "$NUEVA_DB_URL" auth.dump`
5. Comprueba el recuento: compara `recuento_exacto.txt` con `select count(*)` de cada tabla.
6. Actualiza la URL y la clave pública en el `config.js` y en los HTML de las fichas, y la tarea `copia-diaria` (pg_cron).
7. Prueba con una cuenta de prueba: entrar, abrir la sesión 1, guardar XP.

## Estado
- Scripts escritos y revisados (sintaxis comprobada). **No se han ejecutado contra producción** desde aquí: no hay acceso a la contraseña de la base de datos. Una persona debe hacer una primera copia y una restauración de prueba.
