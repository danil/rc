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

## Iterate over strings

```bash
$ for s in World1 World2 ; do echo "Hello, $s!" ; done
Hello, World1!
Hello, World2!
```

## Iterate over range

<http://stackoverflow.com/questions/18460123/how-to-add-leading-zeros-for-for-loop-in-shell#18460742>

```bash
$ for i in {009..010} ; do echo "Hello, World$i!" ; done
Hello, World009!
Hello, World010!
```

## Get home directory by username

<https://superuser.com/questions/484277/get-home-directory-by-username#484280>

```bash
export USER=$(whoami) && echo $(eval echo ~$USER)
echo $(eval echo ~$(whoami))
```
