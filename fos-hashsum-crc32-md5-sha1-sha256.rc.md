# Hash sum rc

## Hash function quality and [speed test][]

[CRC32][] vs [Adler-32][] vs [MurmurHash3][] vs [xxHash][] vs [BLAKE3][]

[adler-32]: https://github.com/madler/zlib
[blake3]: https://github.com/blake3-team/blake3
[crc32]: https://en.wikipedia.org/wiki/Cyclic_redundancy_check
[murmurhash3]: https://github.com/aappleby/smhasher
[speed test]: https://github.com/rurban/smhasher
[xxhash]: https://github.com/cyan4973/xxhash

## [CRC32][] create<sup>[*][crc32.online]</sup>

    brew install gzip 
    echo -n "Hello, World!" | gzip -1 | tail -c 8 | head -c 4 | hexdump -e '1/4 "%08x" "\n"'

    brew install rhash
    echo -n "Hello, World!" | rhash --crc32 -

[crc32.online]: https://crc32.online

## [MD5][] create

    brew install coreutils
    echo -n "Hello, World!" | md5sum
    cat path/to/your/file | md5sum
    md5sum path/to/your/file

    brew install openssl
    echo -n "Hello, World!" | openssl md5

    brew install rhash
    echo -n "Hello, World!" | rhash --md5 -

[md5]: https://en.wikipedia.org/wiki/MD5

## [MD5][] verify/check

    brew install coreutils
    md5sum --check ./file
    echo '1539bad48e984ae1441052dc074c0995  /dev/hdc' | md5sum --check

## [SHA-1][] create

    brew install coreutils
    echo -n "Hello, World!" | sha1sum
    cat path/to/your/file | sha1sum
    sha1sum path/to/your/file

    brew install openssl
    echo -n "Hello, World!" | openssl sha1

    brew install rhash
    echo -n "Hello, World!" | rhash --sha1 -

[sha-1]: https://en.wikipedia.org/wiki/SHA-1

## [SHA-1][] verify/check

    brew install coreutils
    echo '26733b170052a01eb48ed2d5495a5cb51c00bdd0 /dev/hdc' | sha1sum --check

## [SHA-256][] create

    brew install coreutils
    echo -n "Hello, World!" | sha256sum
    cat path/to/your/file | sha256sum
    sha256sum path/to/your/file

    brew install openssl
    echo -n "Hello, World!" | openssl sha256

    brew install rhash
    echo -n "Hello, World!" | rhash --sha256 -

[sha-256]: https://en.wikipedia.org/wiki/SHA-2
