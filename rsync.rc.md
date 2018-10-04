# rsync

## Resume single file download

    rsync --verbose \
          --rsh='ssh -p22022' \
          --progress \
          --append-verify \
          your_user@example.org:/path/to/file .

## Copy from remote server to local machine

<http://stackoverflow.com/questions/9090817/copying-files-using-rsync-from-remote-server-to-local-machine#9090859>

    rsync --checksum \
          --human-readable \
          --archive \
          --verbose \
          --compress \
          --partial \
          --progress \
          --stats \
          danil@h2.kutkevich.org:~/Books/ ./Books/

## Exclude directory

Copy directory exclude directory
<https://stackoverflow.com/questions/4585929/how-to-use-cp-command-to-exclude-a-specific-directory#14789400>

    rsync -av --progress sourcefolder /destinationfolder \
          --exclude thefoldertoexclude1
          --exclude thefoldertoexclude2

## Other

    rsync -rv --stats --delete --compress --skip-compress=jpg,gif,png,mp4 \
      danil@kutkevich.org:~/foo/bar foo
