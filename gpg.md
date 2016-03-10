# GNU Privacy Guard

## Encrypt

    cat file | bzip2 --stdout | gpg --recipient danil --encrypt > file.bz2.gpg
    cat file | tar --extract --gzip --to-stdout --file - | less

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
