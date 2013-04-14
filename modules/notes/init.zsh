# Create or edit notes.
n() {
    # If no note was given, list the notes.
    if [ -z "$1" ]; then
        lt "$NOTEDIR"
    # If a note was given, open it.
    else
        $EDITOR $(buildfile "$NOTEDIR"/"$1")
    fi
}

# Find a note by title.
nf() {
    if [ -z "$1" ]; then
        lt "$NOTEDIR"
    else
        lt "$NOTEDIR" | grep -i $1
    fi
}

# Search within notes.
ns() { cd $NOTEDIR; grep -rin $1; cd "$OLDPWD"; }

# Set autocompletion for notes.
compctl -W $NOTEDIR -f n
