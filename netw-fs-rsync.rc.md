# rsync rc

## Download

    rsync --verbose --human-readable --checksum --partial --append-verify --progress --stats your_usr@your.tld:/path/to/file .

## Upload

<http://stackoverflow.com/questions/9090817/copying-files-using-rsync-from-remote-server-to-local-machine#9090859>

    rsync --verbose --human-readable --checksum --partial --append-verify --progress --stats . your_usr@your.tld:/path/to/file

## Compress

Archive

    rsync --compress your_usr@your.tld:/path/to/file .

## Specify port

    rsync --rsh='ssh -p22022' your_usr@your.tld:/path/to/file .

## Exclude directory

Copy directory exclude directory
<https://stackoverflow.com/questions/4585929/how-to-use-cp-command-to-exclude-a-specific-directory#14789400>

    rsync -av --progress sourcefolder /destinationfolder \
          --exclude thefoldertoexclude1
          --exclude thefoldertoexclude2

## Backup

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

## Other

    rsync -rv --stats --delete --compress --skip-compress=jpg,gif,png,mp4 \
      your_usr@your.tld:~/foo/bar foo
