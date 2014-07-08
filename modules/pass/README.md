Pass
====

Support for an alternative pass[1] directory, with working autocompletion (ie,
for a work-related pass store).

This module also provides a `cplogin` alias which uses sed to extract a
username from the pass entry. The username should be prefixed by the regex
`^login:` (the standard format used by passff[2]). The login string will then
be copied to the clipboard via `xsel`.

    $ pass web/amazon | cplogin

[1] http://www.passwordstore.org/
[2] https://github.com/jvenant/passff

## Configuration

The variable `$ALTPASSDIR` tells the module where the alternative pass directory is. It
should be exported in *~/.zprofile*. The variable must be set and the directory
created before the module is used.

    export ALTPASSDIR=~/.work-pass
