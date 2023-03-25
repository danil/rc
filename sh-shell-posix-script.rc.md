# POSIX shell scritp rc

## Current directory

    BASEDIR="/$0"
    BASEDIR="${BASEDIR%/*}"
    BASEDIR="${BASEDIR:-.}"
    BASEDIR="${BASEDIR##/}/"
    BASEDIR=$(cd "$BASEDIR"; pwd)
