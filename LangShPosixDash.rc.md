# [POSIX][] shell scritp <sup>[*][dash]</sup>rc

[dash]: https://en.wikipedia.org/wiki/Almquist_shell#dash
[posix]: https://en.wikipedia.org/wiki/POSIX

## HOWTO Current directory

    BASEDIR="/$0"
    BASEDIR="${BASEDIR%/*}"
    BASEDIR="${BASEDIR:-.}"
    BASEDIR="${BASEDIR##/}/"
    BASEDIR=$(cd "$BASEDIR"; pwd)
