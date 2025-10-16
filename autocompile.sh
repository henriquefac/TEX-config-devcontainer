#!/bin/bash
if [ -z "$1" ]; then
  echo "Uso: ./autocompile.sh <arquivo-main.tex>"
  exit 1
fi

MAIN_TEX="$1"

echo "Iniciando autocompile via polling (modo seguro)..."
echo "Arquivo principal: $MAIN_TEX"
echo "------------------------------------------"

LAST_HASH=""

while true; do
  # calcula hash de todos os arquivos .tex
  NEW_HASH=$(find . -name "*.tex" -type f -exec md5sum {} + | md5sum | awk '{print $1}')
  
  if [ "$NEW_HASH" != "$LAST_HASH" ]; then
    echo "$(date '+%H:%M:%S') - Recompilando..."
    tectonic "$MAIN_TEX"
    echo "Compilação concluída"
    LAST_HASH="$NEW_HASH"
  fi
  
  sleep 1  # checa a cada 1 segundo
done
