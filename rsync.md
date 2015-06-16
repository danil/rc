<!-- -*- coding: utf-8; -*- -->

rsync
=====

Copy from remote server to local machine
----------------------------------------

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

Other
-----

    rsync -rv --stats --delete --compress --skip-compress=jpg,gif,png,mp4 \
      danil@kutkevich.org:~/foo/bar foo
