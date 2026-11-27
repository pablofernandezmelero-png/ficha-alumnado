# Lista de comprobación con cuenta real

Marca cada casilla al hacerla y anota la fecha y quién la hizo. Usa un correo de pruebas (no el de un alumno real). Al terminar, pide que se elimine esa cuenta de prueba.

Dirección base: https://pablofernandezmelero-png.github.io/ficha-alumnado/

## A. Alumno de pruebas (repetir en 1ci, 1tyl, 2dam y 2bach)
- [ ] Registro: correo + contraseña propia de 10 o más caracteres + código de la clase. Entra sin errores.
- [ ] Con un código de clase incorrecto el registro se rechaza.
- [ ] Inicio de sesión con correo y contraseña. No pide ninguna clave más.
- [ ] Sesión 1: se abre y se ve el contenido.
- [ ] Sesiones 2 a 8: aparecen bloqueadas y no dejan entrar.
- [ ] Audio y vídeo de la sesión 1 se reproducen (1ci, 1tyl, 2dam). En 2bach, los vídeos de YouTube se ven.
- [ ] Mientras suena, aparece el código del alumno encima como marca de agua.
- [ ] Cambiar de pestaña o ventana pausa el audio o el vídeo.
- [ ] No hay botón de descarga ni pantalla completa.
- [ ] Clic derecho sobre el audio no ofrece «Guardar como».
- [ ] Contestar una actividad y pulsar «Save»: sale confirmación.
- [ ] Recargar la página y volver a entrar: el trabajo sigue guardado.
- [ ] Pulsar «Save» dos veces seguidas sin ganar XP nueva no suma dos veces (se comprueba en el panel).
- [ ] Tres contraseñas erróneas bloquean la cuenta un rato.
- [ ] Cerrar sesión y entrar desde otro navegador: se ve el mismo trabajo.

## B. Profesor (solo con su contraseña)
- [ ] Inicio de sesión en `/profesor/`.
- [ ] Se ve la lista de alumnos de cada clase.
- [ ] Bloquear a un alumno: ese alumno ya no puede entrar ni guardar. Desbloquear: vuelve a poder.
- [ ] Abrir y bloquear un apartado (1-8) y la ficha entera: el alumno de pruebas lo nota.
- [ ] «Ejecutar informe» muestra datos de la clase.
- [ ] Pestaña «XP por día»: aparece el alumno de pruebas con la XP del día y se acumula tras otro «Save».
- [ ] Eliminar la cuenta de pruebas desde el panel.

## C. Seguridad básica (profesor o responsable)
- [ ] Activada la protección de la rama `main` en GitHub exigiendo el check «huellas» (Settings, Branches, Add rule).
- [ ] Activada la verificación en dos pasos en GitHub, Supabase y el correo del profesor.
- [ ] Revisado en Supabase el plan contratado y activadas las alertas de uso.
- [ ] Hecha la primera copia externa (`copias/COPIAS_EXTERNAS.md`), cifrada, y probada una restauración.
- [ ] Revisar semanalmente cuentas con muchas sesiones abiertas (función `prof_cuentas_compartidas`, solo profesor).
