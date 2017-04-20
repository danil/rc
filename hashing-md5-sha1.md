# Hashing

## MD5

<https://en.wikipedia.org/wiki/MD5>

### Create

    md5sum FantasqueSansMono-Regular.ttf

### Check

    md5sum --check ./file
    echo '1539bad48e984ae1441052dc074c0995  /dev/hdc' | md5sum --check

## SHA-1

<https://en.wikipedia.org/wiki/SHA-1>

### Check

    echo '26733b170052a01eb48ed2d5495a5cb51c00bdd0 /dev/hdc' | sha1sum --check
