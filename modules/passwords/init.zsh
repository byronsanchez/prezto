# Create or edit password databases.
pw() {
    cd "$PASSDIR"
    if [ ! -z "$1" ]; then
        $EDITOR $(buildfile "$1")
        cd "$OLDPWD"
    fi
}

# Set autocompletion for password databases.
compctl -W $PASSDIR -f pw
