#
# Functions
#

# Check if the encfs filesystem is currently mounted.
encfsstatus() {
    cat /etc/mtab | grep -q "^encfs $ENCFSMOUNT"
}

# Mount the encfs filesystem, if not already mounted.
encfsmount() {
    encfsstatus
    if [ $? -ne 0 ]; then
        gpg --batch -q -d $ENCFSPASS | encfs --stdinpass $ENCFSCRYPT $ENCFSMOUNT
    fi
}

# Dismount the encfs filesystem, if mounted.
encfsdismount() {
    encfsstatus
    if [ $? -eq 0 ]; then
        fusermount -u $ENCFSMOUNT
    fi
}

