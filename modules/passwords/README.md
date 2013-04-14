Passwords
=========

A function for a GnuPG and Vim-based password manager.

See: https://pig-monkey.com/2013/04/4/password-management-vim-gnupg/

## Configuration

The variable `$PASSDIR` tells the module where the password directory is. It
should be exported in *~/.zshenv*. The variable must be set and the directory
created before the module is used.

    export PASSDIR=~/pw
