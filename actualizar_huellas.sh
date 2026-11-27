#!/bin/sh
# Ejecuta esto tras cambiar un HTML/JS oficial y sube también MANIFEST.sha256
git add -A -n >/dev/null
git ls-files '*.html' '*.bin' 'fichas/*/js/*.js' | sort | xargs sha256sum > MANIFEST.sha256
