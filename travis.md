<!-- -*- coding: utf-8; -*- -->

# Travis CI

## Encrypt variable

<https://docs.travis-ci.com/user/encryption-keys>

Add encrypted variable `YOUR_VARIABLE_NAME` to `.travis.yml`
creates possibility to use variable in scripts a-la `echo YOUR_VARIABLE_NAME`.

    travis encrypt YOUR_VARIABLE_NAME=YOUR_VARIABLE_VALUE --add
