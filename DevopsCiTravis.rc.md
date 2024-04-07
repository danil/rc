# Travis CI rc

Command line interface (CLI) for Travis CI (install via RubyGems)
<https://rubygems.org/gems/travis>
<https://github.com/travis-ci/travis.rb>

## Environment variables

<https://docs.travis-ci.com/user/environment-variables/#Default-Environment-Variables>

## Language version environment variable

`$TRAVIS_RUBY_VERSION` or `$TRAVIS_GO_VERSION`.

## Current commit environment variable

The commit that the current build is testing `$TRAVIS_COMMIT`

## Encrypt variable

<https://docs.travis-ci.com/user/encryption-keys>

Addition encrypted variable `$YOUR_VAR_NM` to `.travis.yml`
creates possibility to use variable in scripts a-la `echo $YOUR_VAR_NM`.

    travis encrypt YOUR_VAR_NM=YOUR_VAR_VAL --add

## Encrypt file

<https://docs.travis-ci.com/user/encrypting-files>
<http://scurker.com/automated-deploys-with-travis/>

Encryption of file `path/inside/ropo/file` generates file
`path/inside/ropo/file.enc` and add decryption rule
to `.travis.yml`.

    travis encrypt-file path/inside/ropo/file --add

## Compile

Compile dependencies from source

<https://docs.travis-ci.com/user/installing-dependencies/#Installing-Projects-from-Source>

## Build matrix

<https://docs.travis-ci.com/user/customizing-the-build/#Build-Matrix>

## Validate .travis.yml

<https://docs.travis-ci.com/user/travis-lint/#Command-line-Validation>

    travis lint .travis.yml

## Deploy

    travis setup releases

## Conditional deploy

<https://docs.travis-ci.com/user/deployment#Conditional-Releases-with-on%3A>

Deploy only specific Go version

```yaml
deploy:
  on:
    condition: "$TRAVIS_GO_VERSION = 1.6.2"
```
