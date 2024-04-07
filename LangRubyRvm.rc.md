# Ruby Version Manager

<http://rvm.beginrescueend.com>

## Install

    bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)

## Upgrading RVM

    rvm get latest

## Other

    rvm list known
    rvm --force install 1.9.2
    rvm use 1.9.2
    rvm info
    rvm use 1.9.2@danil --default

## Gemset

    rvm gemset create gemset_foo
    rvm use 1.8.7@gemset_foo
    rvm gemset list
    rvm gemset copy 1.8.7@avers_prohq 1.8.7@avers_prohq_accounting
    rvm gemset delete avers_prohq_accounting
