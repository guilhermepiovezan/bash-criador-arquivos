#!/bin/bash

# Defina seu nome aqui
NOME="Guilherme"

# Encontra o maior número já utilizado nos arquivos com o padrão
ULTIMO_NUMERO=$(ls ${NOME}[0-9]* 2>/dev/null | grep -oP "${NOME}\K[0-9]+" | sort -n | tail -1)

# Se não houver arquivos, começa do 1
if [ -z "$ULTIMO_NUMERO" ]; then
  ULTIMO_NUMERO=0
fi

# Calcula o próximo número inicial
INICIO=$((ULTIMO_NUMERO + 1))

# Cria 25 arquivos com nomes sequenciais
for ((i=0; i<25; i++)); do
  NUM=$((INICIO + i))
  touch "${NOME}${NUM}"
done

# Mostra o conteúdo do diretório
ls -lh ${NOME}*

