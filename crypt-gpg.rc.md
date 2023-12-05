# GPG rc

[GPG][] is the GNU Privacy Guard.

[gpg]: https://github.com/gpg/gnupg

## Encrypt asymmetric by key

    cat file | bzip2 --stdout | gpg --recipient danil --encrypt > file.bz2.gpg

## Encrypt symmetric by password

Symmetric key algorithm by password

## Encrypt symmetric by password interactive

Prompt password interactively

    gpg --symmetric --armor file.tar.gz

## Encrypt symmetric by password from stdin

Get password from standard input

    echo $your_pwd| gpg --passphrase-fd 0 --symmetric --armor file.tar.gz

## Encrypt symmetric by password file from stdin

**NOT WORKING**

Redirect file from stdin

    find path/to/dir \
      | tar --create --gzip --to-stdout --files-from - > file.tar.gz

## Decrypt asymmetric by key

Asymmetric algorithm by pairs of keys

    cat file.bz2.gpg \
      | gpg --recipient danil --decrypt \
      | bzip2 --decompress --stdout > file

## Decrypt symmetric by password interactive

Prompt password interactively

    gpg --output - path/to/file.tar.gz.asc \
      | tar --extract --gzip --file -

## Decrypt symmetric by password from stdin

Redirect password from stdin
<http://stackoverflow.com/questions/19895122/how-to-use-gnupgs-passphrase-fd-argument#21007390>

    echo $your_pwd \
      | gpg --passphrase-fd 0 --decrypt --batch -- path/to/file.tar.gz.asc \
      | tar --extract --gzip --file -

## Other

    gpg --gen-key
    gpg --keyserver subkeys.pgp.net --recv-keys 17072058
    gpg --verify <signature file> <downloaded iso>
