# [rsync][] <sup><sub>[rsync man][] [3018254905][] [1829820022][]</sub></sup> rc

[rsync man]: https://download.samba.org/pub/rsync/rsync.1
[rsync]: https://github.com/rsyncproject/rsync
[1829820022]: https://en.wikipedia.org/wiki/Rsync
[3018254905]: https://rsync.samba.org

* HOWTO Download  `rsync --verbose --human-readable --checksum --partial --append-verify --progress --stats your_usr@your.tld:/path/to/file .`
* HOWTO Upload    `rsync --verbose --human-readable --checksum --partial --append-verify --progress --stats . your_usr@your.tld:/path/to/file` <sup><sub>[3455155745][]</sub></sup>
*   DOC Exit code `0` Success. `1` Syntax or usage error. `2` Protocol incompatibility. `3` Errors selecting input/output files, dirs. `4` Requested action not supported. `5` Error starting client-server protocol. `6` Daemon unable to append to log-file. `10` Error in socket `I/O`. `11` Error in file `I/O`. `12` Error in rsync protocol data stream. `13` Errors with program diagnostics. `14` Error in `IPC` code. `20` Received `SIGUSR1` or `SIGINT`. `21` Some error returned by `waitpid()`. `22` Error allocating core memory buffers. `23` Partial transfer due to error. `24` Partial transfer due to vanished source files. `25` The `--max-delete` limit stopped deletions. `30` Timeout in data send/receive. `35` Timeout waiting for daemon connection. <sup><sub>[Exit values][2041041010] [4171816895][] [3630225293][] [2425608637][]</sub></sup>
* HOWTO Archive   `sudo rsync --archive path/to/dir path/to/dir2`               <sup><sub>Copy as arching of a directory folder keeping owner and permission intact. Copy like backuping of a folder preserve user author. Preserve the specified attribute, directory, file mode, ownership, timestamps, if possible context, links, xattr, all. Example of [cp backup][2765110904] vs [rsync backup][3289888669].</sub></sup>
* HOWTO Compress  `rsync --compress your_usr@your.tld:/path/to/file .`          <sup><sub>Archive.</sub></sup>
* HOWTO Port      `rsync --rsh='ssh -p22022' your_usr@your.tld:/path/to/file .` <sup><sub>Specify port.</sub></sup>
* HOWTO Exclude   `rsync -av --progress sourcefolder /destinationfolder --exclude thefoldertoexclude1 --exclude thefoldertoexclude2` <sup><sub>Copy directory excludes directory. [664979604][]</sub></sup>
* HOWTO Backup    `rsync --verbose --human-readable --checksum --partial --append-verify --progress --stats --compress --archive path/to/dir1 path/to/dir2 your_usr@your.tld:/path/to/dir`

[2041041010]: https://download.samba.org/pub/rsync/rsync.1#EXIT_VALUES
[2425608637]: https://superuser.com/questions/847850/behavior-of-rsync-with-file-thats-still-being-written#848123
[2765110904]: https://unix.stackexchange.com/questions/43605/how-do-i-copy-a-folder-keeping-owners-and-permissions-intact#43608
[3289888669]: https://unix.stackexchange.com/questions/43605/how-do-i-copy-a-folder-keeping-owners-and-permissions-intact#43611
[3455155745]: http://stackoverflow.com/questions/9090817/copying-files-using-rsync-from-remote-server-to-local-machine#9090859
[3630225293]: https://unix.stackexchange.com/questions/63410/rsync-skip-files-for-which-i-dont-have-permissions#491461
[4171816895]: https://bobcares.com/blog/rsync-error-24
[664979604]: https://stackoverflow.com/questions/4585929/how-to-use-cp-command-to-exclude-a-specific-directory#14789400

## HOWTO `rsyncd` daemon mode by `rsync://` protocol

    # your.server.tld:
    printf "hosts deny = *\nread only = no\nauth users = root\nsecrets file = /etc/rsyncd.secrets\nstrict modes = true\n[your-module]\npath = /your/path\nhosts allow = your.client.tld\nlog file = /var/log/rsyncd.log\n" > /etc/rsyncd.conf
    printf "root:your-pwd\n" > /etc/rsyncd.secrets
    chmod 600 /etc/rsyncd.secrets
    chmod 600 ~/.rsyncrc
    rsync --daemon
    # your.client.tld:
    printf "your-pwd" > ~/.rsyncrc
    rsync --password-file=path/to/rsync.password --list-only rsync://root@your.server.tld/your-module
