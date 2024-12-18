# cp rc

* HOWTO Preserve path `cp --parents foo/123/bar/abc.xml foo/321/baz/xyz.html .` <sup><sub>Preserving directory path. [280446655][]</sub></sup>
* HOWTO Archive       `sudo cp --archive path/to/dir path/to/dir2`              <sup><sub>Copy as arching of a directory folder keeping owner and permission intact. Copy like backuping of a folder preserve user author. Preserve the specified attribute, directory, file mode, ownership, timestamps, if possible context, links, xattr, all. Example of [cp backup][2765110904] vs [rsync backup][3289888669].</sub></sup>

[2765110904]: https://unix.stackexchange.com/questions/43605/how-do-i-copy-a-folder-keeping-owners-and-permissions-intact#43608
[280446655]: http://serverfault.com/questions/180853/how-to-copy-file-preserving-directory-path-in-linux#180870
[3289888669]: https://unix.stackexchange.com/questions/43605/how-do-i-copy-a-folder-keeping-owners-and-permissions-intact#43611
