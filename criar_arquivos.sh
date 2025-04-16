#!/bin/bash

# Definir meu nome aqui
NOME="Guilherme"

# Encontrar o maior número já utilizado nos arquivos 
ULTIMO_NUMERO=$(ls ${NOME}[0-9]* 2>/dev/null | grep -oP "${NOME}\K[0-9]+" | sort -n | tail -1)

# Se não houver arquivos, começa do 1
if [ -z "$ULTIMO_NUMERO" ]; then
  ULTIMO_NUMERO=0
fi

# Calcular o próximo número inicial
INICIO=$((ULTIMO_NUMERO + 1))

# Criar 25 arquivos com nomes sequenciais
for ((i=0; i<25; i++)); do
  NUM=$((INICIO + i))
  touch "${NOME}${NUM}"
done

# Mostrar o conteúdo do diretório
ls -lh ${NOME}*

