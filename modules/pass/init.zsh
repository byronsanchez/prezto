wpass() {
    PASSWORD_STORE_DIR="$ALTPASSDIR" pass "$@"
}
compdef -e 'PASSWORD_STORE_DIR=$ALTPASSDIR _pass' wpass

alias cplogin='sed -n "/^login/Is/login:\s\+//p" | xsel -ib'
