# diff rc

## Compare stdin/pipelines

    diff <(echo -e "foo\n123") <(echo -e "foo\n123" | tr '[:upper:][:lower:]' '[:lower:][:upper:]')

## Compare wordwise/word per word basis

    wdiff <(echo foo bar) <(echo foo xyz)

## Compare directories

<http://linuxcommando.blogspot.com/2008/05/compare-directories-using-diff-in-linux.html>

    diff --recursive --brief ~/dir1 ~/dir2 | grep Only
    colordiff --recursive path/to/dir1 path/to/dir2

## Colorize output

    colordiff --ignore-space-change path/to/1.file path/to/2.file
