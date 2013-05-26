#
# Functions
#

# Check if the ledger filesystem is currently mounted.
ledgerstatus() {
    cat /etc/mtab | grep -q "^encfs $LEDGERMOUNT"
}

# Mount the ledger filesystem, if not already mounted.
ledgermount() {
    ledgerstatus
    if [ $? -ne 0 ]; then
        gpg --batch -q -d $LEDGERPASS | encfs --stdinpass $LEDGERCRYPT $LEDGERMOUNT
    fi
}

# Dismount the ledger filesystem, if mounted.
ledgerdismount() {
    ledgerstatus
    if [ $? -eq 0 ]; then
        fusermount -u $LEDGERMOUNT
    fi
}

#
# Aliases
#

alias ledger='ledgermount && /usr/bin/ledger'
