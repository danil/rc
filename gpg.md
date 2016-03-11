# GNU Privacy Guard

## Encrypt

### Asymmetric by key

    cat file | bzip2 --stdout | gpg --recipient danil --encrypt > file.bz2.gpg

### Symmetric by password

Symmetric by passphrase from stdin not working(

    find path/to/dir \
      | tar --create --gzip --to-stdout --files-from - > file.tar.gz
    gpg --symmetric --armor file.tar.gz

## Decrypt

### Asymmetric by key

    cat file.bz2.gpg \
      | gpg --recipient danil --decrypt \
      | bzip2 --decompress --stdout > file

### Symmetric by password

    gpg --output - path/to/file.tar.gz.asc | tar --extract --gzip --file -

## Other

    gpg --keyserver subkeys.pgp.net --recv-keys 17072058
    gpg --verify <signature file> <downloaded iso>
