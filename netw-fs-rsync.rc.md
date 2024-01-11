# rsync rc

## HOWTO Download

    rsync --verbose --human-readable --checksum --partial --append-verify --progress --stats your_usr@your.tld:/path/to/file .

## HOWTO Upload <sup>[*][3455155745]</sup>

    rsync --verbose --human-readable --checksum --partial --append-verify --progress --stats . your_usr@your.tld:/path/to/file

[3455155745]: http://stackoverflow.com/questions/9090817/copying-files-using-rsync-from-remote-server-to-local-machine#9090859

## HOWTO Compress/archive

    rsync --compress your_usr@your.tld:/path/to/file .

## HOWTO Specify port

    rsync --rsh='ssh -p22022' your_usr@your.tld:/path/to/file .

## HOWTO Copy directory exclude directory <sup>[*][664979604]</sup>

    rsync -av --progress sourcefolder /destinationfolder \
          --exclude thefoldertoexclude1
          --exclude thefoldertoexclude2

[664979604]: https://stackoverflow.com/questions/4585929/how-to-use-cp-command-to-exclude-a-specific-directory#14789400

## HOWTO Backup

    rsync --verbose \
          --human-readable \
          --checksum \
          --partial \
          --append-verify \
          --progress \
          --stats \
          --compress \
          --archive \
          path/to/dir1 \
          path/to/dir2 \
          your_usr@your.tld:/path/to/dir

## HOWTO `rsyncd` daemon mode by `rsync://` protocol

    printf "hosts deny = *\nread only = no\nauth users = root\nsecrets file = /etc/rsyncd.secrets\nstrict modes = true\n[your-host]\npath = /your/path\nhosts allow = your.tld\nlog file = /var/log/rsyncd.log\n" > /etc/rsyncd.conf
    printf "root:your-pwd\n" > /etc/rsyncd.secrets
    chmod 600 /etc/rsyncd.secrets
    printf "your-pwd" > ~/.rsyncrc
    chmod 600 ~/.rsyncrc
