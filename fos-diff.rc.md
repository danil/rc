# diff rc

    colordiff --ignore-space-change path/to/1.file path/to/2.file

## Compare directories

<http://linuxcommando.blogspot.com/2008/05/compare-directories-using-diff-in-linux.html>

    diff --recursive --brief ~/dir1 ~/dir2 | grep Only
    colordiff --recursive path/to/dir1 path/to/dir2
