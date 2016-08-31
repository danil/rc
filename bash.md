# Bash

## Path related to script

File path related to script

    ls "${BASH_SOURCE%/*}"/path/to/file

## Temporary file

* http://unix.stackexchange.com/questions/181937/how-create-a-temporary-file-in-shell-script#181938
* https://www.gnu.org/software/coreutils/manual/coreutils.html#mktemp-invocation
* https://ru.wikipedia.org/wiki/GNU_Coreutils

```bash
t=$(mktemp /tmp/filename.XXXXXX) && echo "Hello, World!" > $t && cat $t && rm $t
```

## Escape single quotes

Escape single quotes within single quotes
<http://stackoverflow.com/questions/1250079/how-to-escape-single-quotes-within-single-quoted-strings>

    echo 'Here'"'"'s my test...'
    echo 'Here'\''s my test...'
