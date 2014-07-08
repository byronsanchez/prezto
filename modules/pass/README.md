Pass
====

Support for an alternative pass[1] directory, with working autocompletion (ie,
for a work-related pass store).

[1] http://www.passwordstore.org/

## Configuration

The variable `$ALTPASSDIR` tells the module where the alternative pass directory is. It
should be exported in *~/.zprofile*. The variable must be set and the directory
created before the module is used.

    export ALTPASSDIR=~/.work-pass
