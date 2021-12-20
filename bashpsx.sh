#! /bin/bash

# declare -r PROMPT_COMMAND="source bashpsx.sh"

#if [[ "${DEFAULTPS1#}" -lt 0 ]]; then
#    export DEFAULTPS1=
#fi

KEEPSTATUS=$?

# Status code
# Usar diretamente $? não mostra a saída final no prompt
# porém ainda é possível ver ecom echo $?
# Hipótese: $? guarda as saídas da runtime do script
# Mas para o terminal, a saída geral permanece
if [ $KEEPSTATUS -eq 0 ]; then
    STATUS="\033[3;32m$KEEPSTATUS\033[0;39m "
else
    STATUS="\033[3;31m$KEEPSTATUS\033[0;39m "
fi

# Git
if [ -e .git ]; then
    BRANCH=$(cat ".git/HEAD" | rev | cut -d'/' -f1 | rev)
    GITOUT="\033[1mGit: \033[0m\033[45m\033[0;37;45m[\033[1;37;45m$BRANCH\033[0;37;45m]\n\033[0m"
else
    GITOUT=""
fi

export PS1="$GITOUT$STATUS$DEFAULTPS1"
