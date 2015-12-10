<!-- -*- coding: utf-8; -*- -->

# Travis CI

Command line interface (CLI) for Travis CI (install via RubyGems)
<https://rubygems.org/gems/travis>
<https://github.com/travis-ci/travis.rb>

## Encrypt variable

<https://docs.travis-ci.com/user/encryption-keys>

Addition encrypted variable `YOUR_VARIABLE_NAME` to `.travis.yml`
creates possibility to use variable in scripts a-la `echo YOUR_VARIABLE_NAME`.

    travis encrypt YOUR_VARIABLE_NAME=YOUR_VARIABLE_VALUE --add
