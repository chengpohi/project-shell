#!/usr/bin/env bash

file=$RUN_PATH"/env.properties"

function evalEnv () {
    if [ -f "$1" ]
    then
        #echo "read \"$1\" properties variable."
        while IFS='=' read -r key value
        do
            if [[ ${key:0:1} != \# ]]
            then
                key=$(echo "$key" | tr '.' '_' | tr '-' '_' | tr '[' '_' | tr ']' '_')
                v=`eval "echo '${value}'"`
                if [[ ! -z $key ]]
                then
                    eval "export ${key}='${v}'"
                fi
            fi
        done < "$1"
    else
        echo "$1 not found."
    fi
}

evalEnv $file

echo "source ~/.zshrc" > $RUN_PATH/.zshrc

for f in "$RUN_PATH/functions"/*.sh
do
    cat $f >> $RUN_PATH/.zshrc
done

cat <<'EOT' >> $RUN_PATH/.zshrc
autoload -U colors && colors
export PATH=$PATH:/usr/local/bin
PROMPT="%{$fg[red]%}[$shell_name]%{$fg[green]%}[%1d]=>%{$reset_color%}"
autoload -U add-zsh-hook
add-zsh-hook chpwd update_prompt
function update_prompt() {
  PROMPT=$'%{$fg[red]%}[$shell_name]%{$fg[green]%}[%1d]=>%{$reset_color%}'
}
echo "Welcome to $shell_name shell!"
zsh --version
rm $RUN_PATH/.zshrc >> /dev/null 2>&1
rm "$RUN_PATH/.zcompdump-*" 2> /dev/null
EOT


export RED='\033[0;31m'
export GREEN='\033[0;32m'
export NC='\033[0m'
