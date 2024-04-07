# Base64

## Encode/decode

    echo -n "Hello, World!" | openssl base64 -A | openssl base64 -A -d
    echo -n "Hello, World!" | base64 -w 0 | base64 --decode
