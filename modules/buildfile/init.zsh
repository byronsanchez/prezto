# Take a text file and build it with an extension, if needed.
# Prefer gpg extension over txt.
buildfile() {
    # If an extension was given, use it.
    if [[ "$1" == *.* ]]; then
        echo "$1"

    # If no extension was given...
    else
        # ... try the file without any extension.
        if [ -e "$1" ]; then
            echo "$1"
        # ... try the file with a gpg extension.
        elif [ -e "$1".gpg ]; then
            echo "$1".gpg
        # ... use a txt extension.
        else
            echo "$1".txt
        fi
    fi
}
