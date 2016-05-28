# Travis CI

Command line interface (CLI) for Travis CI (install via RubyGems)
<https://rubygems.org/gems/travis>
<https://github.com/travis-ci/travis.rb>

## Encrypt variable

<https://docs.travis-ci.com/user/encryption-keys>

Addition encrypted variable `YOUR_VARIABLE_NAME` to `.travis.yml`
creates possibility to use variable in scripts a-la `echo YOUR_VARIABLE_NAME`.

    travis encrypt YOUR_VARIABLE_NAME=YOUR_VARIABLE_VALUE --add

## Encrypt file

<https://docs.travis-ci.com/user/encrypting-files>
<http://scurker.com/automated-deploys-with-travis/>

Encryption of file `path/inside/repository/file` generates file
`path/inside/repository/file.enc` and add decryption rule
to `.travis.yml`.

    travis encrypt-file path/inside/repository/file --add

## Compile

Compile dependencies from source

<https://docs.travis-ci.com/user/installing-dependencies/#Installing-Projects-from-Source>

## Build matrix

<https://docs.travis-ci.com/user/customizing-the-build/#Build-Matrix>

## Validate .travis.yml

    travis lint .travis.yml
