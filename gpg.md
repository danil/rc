# GNU Privacy Guard

## Encrypt

    cat file | bzip2 --stdout | gpg --recipient danil --encrypt > file.bz2.gpg

    find path/to/dir \
      | tar --create --gzip --to-stdout --files-from - \
      | gpg --recipient danil --encrypt \
      > file.tar.gz.gpg

## Decrypt

    cat file.bz2.gpg \
      | gpg --recipient danil --decrypt \
      | bzip2 --decompress --stdout > file

    cat file.tar.gz \
      | gpg --recipient danil --decrypt \
      | tar --extract --gzip --file -

## Other

    gpg --keyserver subkeys.pgp.net --recv-keys 17072058
    gpg --verify <signature file> <downloaded iso>
