# Hash sum rc

## Hash function quality and [speed test][]

[CRC-32][] vs [Adler-32][] vs [MurmurHash3][] vs [xxHash][] vs [BLAKE3][]

[adler-32]: https://github.com/madler/zlib
[blake3]: https://github.com/blake3-team/blake3
[crc-32]: https://en.wikipedia.org/wiki/Cyclic_redundancy_check
[murmurhash3]: https://github.com/aappleby/smhasher
[speed test]: https://github.com/rurban/smhasher
[xxhash]: https://github.com/cyan4973/xxhash

## [MD5][] create

    cat path/to/file | md5sum
    md5sum path/to/file

[md5]: https://en.wikipedia.org/wiki/MD5

## MD5 verify/check

    md5sum --check ./file
    echo '1539bad48e984ae1441052dc074c0995  /dev/hdc' | md5sum --check

## [SHA-1][] Create

    cat path/to/file | sha1sum
    sha1sum path/to/file

[sha-1]: https://en.wikipedia.org/wiki/SHA-1

## SHA-1 verify/check

    echo '26733b170052a01eb48ed2d5495a5cb51c00bdd0 /dev/hdc' | sha1sum --check
