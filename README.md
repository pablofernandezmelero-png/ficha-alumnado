# Fichas online del alumnado

- `index.html`: portal del alumnado (registro con correo + contraseña y código de clase; después, solo correo + contraseña).
- `profesor/index.html`: informe de clase y gestión para el profesorado (cuenta de profesor + código único + clave de confirmación).
- `fichas/`: una carpeta por clase. Cada ficha guarda el trabajo en la cuenta del alumno (Supabase), con botón Guardar, autoguardado y telemetría.

## Índice por clase y tema

| Clase | Carpeta | Contenido | Unidades |
|---|---|---|---|
| 1 Comercio Internacional | `fichas/1ci/` | Trade Floor: 8 sesiones (Spec Sheet Rookie, Smart Seller, Compare & Convince, Phone Pro, Message Master, Survey Sleuth, Review Rally, Boss Battle) | Units 5 y 6 |
| 1 Transporte y Logística | `fichas/1tyl/` | Cargo Run: 8 turnos (Mailroom Rookie, Priority Sort, Courier Desk, Damaged Goods, The Shipping Order, Freight Negotiator, Sourcing Scout, Launch Day) | Units 4 y 5 |
| 2º DAM | `fichas/2dam/` | Operation Helpdesk: portada + 8 turnos (The Translator … Boss Battle) | Units 5 Troubleshooting, 6 IT Helpline, 7 Customer Service |
| 2º Bachillerato J | `fichas/2bach/` | PULSE · Living Well: 8 sesiones (Running on Empty, The Hidden Crew, Germ Wars, Second Chances, Under Pressure, Write to Heal, The Big Exam, Graduation Day) | Unit 2 |
| 2º SMR B y C | — | Sin ficha de alumno todavía (solo hay secuencia didáctica del profesorado, que no se publica) | Units 5-7 |

Dentro de cada carpeta: `content/` o `sessions/` (sesiones) y `media/` (vídeos y audios). **Todo el contenido de las sesiones y todos los vídeos/audios están cifrados (`.bin`, AES-256-GCM)**: no hay ningún mp3/mp4 en claro en el repositorio. El navegador pide la clave de cada sesión a la base de datos solo si el alumno tiene sesión iniciada, pertenece a la clase y el apartado no está bloqueado; descifra en memoria y reproduce sin botón de descarga. Los originales se guardan fuera del repositorio.

## Contenido de terceros y voces sintéticas

- Los vídeos de YouTube (2º Bachillerato) se incrustan con el reproductor oficial (youtube-nocookie); no se copian ni se alojan aquí.
- Los audios de listening de las fichas son voces sintéticas generadas a partir de guiones originales; las voces del navegador (síntesis del dispositivo) se usan cuando no hay mp3.
- Los vídeos de `media/` son material propio del profesorado: comprobar que no incluyen fragmentos de terceros sin licencia antes de abrir el repositorio a más usuarios.

Este repositorio es público. No subir aquí PIN, contraseñas, claves `service_role` ni archivos `*_PRIVADO*`.
La única clave que aparece en los archivos es la clave pública (publishable) de Supabase, pensada para ir en el navegador.
Tras cambiar un HTML/JS oficial: `sh actualizar_huellas.sh` y subir también `MANIFEST.sha256`.
