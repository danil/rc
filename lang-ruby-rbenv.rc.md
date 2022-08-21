# rbenv

## Install

* https://github.com/rbenv/rbenv#basic-github-checkout
* https://github.com/rbenv/ruby-build#installation

    git clone git@github.com:rbenv/rbenv.git ~/.rbenv
    mkdir -p "$(rbenv root)"/plugins
    git clone git@github.com:rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

## List installed

rbenv versions

## List stable versions

    rbenv install --list

## List all available veraion

    rbenv install --list-all
