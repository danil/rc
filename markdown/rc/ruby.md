Ruby
====

Installation
------------

    ./ruby-1.8.7-p72/configure --prefix=$HOME --enable-shared \
                               --enable-pthread --with-readline-dir=/lib \
                               --enable-install-doc

Environment
-----------

    export GEM_HOME="~/lib/ruby/gems/1.8"
    export RUBYLIB="~/lib/ruby:~/lib/site_ruby/1.8"
    export RUBYOPT=rubygems

RubyGems
========

Installation
------------

    ruby ./rubygems-1.3.0/setup.rb --no-rdoc --no-ri

Commands
--------

    gem install --include-dependencies --no-rdoc --no-ri rails
    gem install rails -s http://gems.rubyonrails.org
