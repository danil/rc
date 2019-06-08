# Hashing

md5 vs crc32 vs murmur3 vs xxhash

## MD5

<https://en.wikipedia.org/wiki/MD5>

### Create

    cat path/to/file | md5sum
    md5sum path/to/file

### Check

    md5sum --check ./file
    echo '1539bad48e984ae1441052dc074c0995  /dev/hdc' | md5sum --check

## SHA-1

<https://en.wikipedia.org/wiki/SHA-1>

### Create

    cat path/to/file | sha1sum
    sha1sum path/to/file

### Check

    echo '26733b170052a01eb48ed2d5495a5cb51c00bdd0 /dev/hdc' | sha1sum --check
