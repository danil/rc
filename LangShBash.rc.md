# [Bash][] shell scrip rc

[bash]: https://en.wikipedia.org/wiki/Bash_(Unix_shell)

* HOWTO Path related to script `ls "${BASH_SOURCE%/*}"/path/to/file` <sup><sub>File path related to script</sub></sup>
* HOWTO Condition by one line VER2 `[ "$your_var" = "foo" ] && echo 1 || echo 0`
* HOWTO Condition by one line VER1 `if [ "$your_var" = "foo" ]; then echo 1; else echo 0; fi`
* HOWTO Temporary file `f=$(mktemp /tmp/filename.XXXXXX) && echo "Hello, World!" > $f && cat $f && rm $f` <sup><sub>[4291661438][] [1184632536][] [1281005826][]</sub></sup>
* HOWTO Escape single quotes VER2 `echo 'Here'"'"'s my test...'` <sup><sub>Escape single quotes within single quotes. [4265458641][]</sub></sup>
* HOWTO Escape single quotes VER1 `echo 'Here'\''s my test...'`
* HOWTO Random [UUID][] `cat /proc/sys/kernel/random/uuid` <sup><sub>Generate</sub></sup>
* HOWTO Run as user and group `sudo -u your_usr -g your_grp path/to/your/script`

[uuid]: https://datatracker.ietf.org/doc/html/rfc4122 "RFC 4122"
[1184632536]: https://gnu.org/software/coreutils/manual/coreutils.html#mktemp-invocation
[1281005826]: https://ru.wikipedia.org/wiki/GNU_Coreutils
[4265458641]: http://stackoverflow.com/questions/1250079/how-to-escape-single-quotes-within-single-quoted-strings
[4291661438]: http://unix.stackexchange.com/questions/181937/how-create-a-temporary-file-in-shell-script#181938

## HOWTO Condition

```bash
if [ "$your_var" = "foo" ]; then
    echo 1
else
    echo 0
fi
```

## HOWTO Iterate over strings

```bash
$ for s in World1 World2 ; do echo "Hello, $s!" ; done
Hello, World1!
Hello, World2!
```

## HOWTO Iterate over range <sup><sub>[1329543776][]</sub></sup>

```bash
$ for i in {009..010} ; do echo "Hello, World$i!" ; done
Hello, World009!
Hello, World010!
```

[1329543776]: http://stackoverflow.com/questions/18460123/how-to-add-leading-zeros-for-for-loop-in-shell#18460742

## HOWTO Get home directory by username <sup><sub>[2150391725][]</sub></sup>

```bash
export USER=$(whoami) && echo $(eval echo ~$USER)
echo $(eval echo ~$(whoami))
```

[2150391725]: https://superuser.com/questions/484277/get-home-directory-by-username#484280
