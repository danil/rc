# cp

## Preserving attributes

Preserve the specified attributes such as directory an file mode,
ownership, timestamps,
if possible additional attributes: context, links, xattr, all.

    cp --archive ~/var/www/ ~/tmp/

## Preserving directory path

Copy file preserving directory path
<http://serverfault.com/questions/180853/how-to-copy-file-preserving-directory-path-in-linux#180870>.

    cp --parents foo/123/bar/abc.xml foo/321/baz/xyz.html .
