# diff rc

## HOWTO Compare stdin/pipelines

    diff <(echo -e "foo\n123") <(echo -e "foo\n123" | tr '[:upper:][:lower:]' '[:lower:][:upper:]')

## HOWTO Compare wordwise/word per word basis

    wdiff <(echo foo bar) <(echo foo xyz)

## HOWTO Compare directories <sup><sub>[2010630474][] [1862711630][]</sub></sup>

    diff --recursive --brief ~/dir1 ~/dir2 | grep Only
    colordiff --recursive path/to/dir1 path/to/dir2

[2010630474]: https://stackoverflow.com/questions/4997693/given-two-directory-trees-how-can-i-find-out-which-files-differ-by-content#4997724
[1862711630]: http://linuxcommando.blogspot.com/2008/05/compare-directories-using-diff-in-linux.html

## HOWTO Colorize output

    colordiff --ignore-space-change path/to/1.file path/to/2.file
