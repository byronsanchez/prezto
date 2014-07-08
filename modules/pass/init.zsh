wpass() {
    PASSWORD_STORE_DIR="$ALTPASSDIR" pass "$@"
}
compdef -e 'PASSWORD_STORE_DIR=$ALTPASSDIR _pass' wpass
