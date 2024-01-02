# [Dash][] [POSIX][] shell scritp rc

[dash]: https://en.wikipedia.org/wiki/Almquist_shell#dash
[posix]: https://en.wikipedia.org/wiki/POSIX

## Current directory

    BASEDIR="/$0"
    BASEDIR="${BASEDIR%/*}"
    BASEDIR="${BASEDIR:-.}"
    BASEDIR="${BASEDIR##/}/"
    BASEDIR=$(cd "$BASEDIR"; pwd)
