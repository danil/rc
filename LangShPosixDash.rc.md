# [POSIX][] shell scritp <sup>[Dash][3684003326]. [Dash Git][630800871]. POSIX shell script tutorials: [2441553388][] and [539546667][].</sup>rc

[posix]: https://en.wikipedia.org/wiki/POSIX
[2441553388]: https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html  "POSIX shell script tutorial."
[3684003326]: https://en.wikipedia.org/wiki/Almquist_shell#dash "Dash."
[539546667]: https://grymoire.com/Unix/Sh.html "POSIX shell script tutorial."
[630800871]: https://git.kernel.org/pub/scm/utils/dash/dash.git "Dash Git."

## HOWTO Current directory

    BASEDIR="/$0"
    BASEDIR="${BASEDIR%/*}"
    BASEDIR="${BASEDIR:-.}"
    BASEDIR="${BASEDIR##/}/"
    BASEDIR=$(cd "$BASEDIR"; pwd)
