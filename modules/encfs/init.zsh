#
# Functions
#

# Check if the encfs filesystem is currently mounted.
encfsstatus() {
    if [[ "$OSTYPE" == cygwin* ]]; then
        cat /etc/mtab | grep -q "encfs.exe"
    else
        cat /etc/mtab | grep -q "^encfs $ENCFSMOUNT"
    fi
}

# Mount the encfs filesystem, if not already mounted.
encfsmount() {
    encfsstatus
    if [ $? -ne 0 ]; then

        if [[ "$OSTYPE" == cygwin* ]]; then
            # Windows cygwin has to convert cygwin paths to windows path so 
            # GPG4Win can read it
            export WINDOWSENCFSPASS=`cygpath -am ${ENCFSPASS}`
            export WINDOWSENCFSCRYPT=`cygpath -am ${ENCFSCRYPT}`
            # We have to mount directly to a drive letter in Windows to prevent 
            # encfs4windows from having file/folder not found issues
            export WINDOWSENCFSMOUNT="X:/"
            gpg --batch -q -d $WINDOWSENCFSPASS | encfs --stdinpass $WINDOWSENCFSCRYPT $WINDOWSENCFSMOUNT
        else
            gpg --batch -q -d $ENCFSPASS | encfs --stdinpass $ENCFSCRYPT $ENCFSMOUNT
        fi

    fi
}

# Dismount the encfs filesystem, if mounted.
encfsdismount() {
    encfsstatus
    if [ $? -eq 0 ]; then

        if [[ "$OSTYPE" == cygwin* ]]; then
            Sudo dokanctl /u X
        else
            fusermount -u $ENCFSMOUNT
        fi

    fi
}

