# diff

    colordiff --ignore-space-change postgresql-8.4 ._cfg0000_postgresql-8.4

## Compare directories

<http://linuxcommando.blogspot.com/2008/05/compare-directories-using-diff-in-linux.html>

    diff --recursive --brief ~/dir1 ~/dir2| grep Only
    colordiff --recursive prealpha.kutkevich-org/ alpha.kutkevich-org/

## Prepare patch

<http://devmanual.gentoo.org/tools-reference/diff-and-patch>

    diff --unified foo.c.~master~ foo.c

# Patch

## Apply patch

<http://cyberciti.biz/faq/appy-patch-file-using-patch-command/>

    patch -p1 < {/path/to/patch/file}
