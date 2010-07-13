<!-- -*- coding: utf-8-unix; -*-
     Danil Kutkevich's reference cards <http://kutkevich.org/rc>.
     Copyright (C) 2007, 2008, 2009, 2010 Danil Kutkevich <danil@kutkevich.org>

     This reference cards is licensed under the Creative Commons
     Attribution-Share Alike 3.0 Unported License. To view a copy of this
     license, see the COPYING file or visit
     <http://creativecommons.org/licenses/by-sa/3.0/> or send a letter to
     Creative Commons, 171 Second Street, Suite 300, San Francisco,
     California, 94105, USA. -->

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

Other
-----

    ruby -r rubygems ts_feed2imap.rb

RubyGems
========

Installation
------------

    ruby ./rubygems-1.3.0/setup.rb --no-rdoc --no-ri

Commands
--------

    gem install --include-dependencies --no-rdoc --no-ri rails
    gem install rails -s http://gems.rubyonrails.org
