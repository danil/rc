<!-- -*- coding: utf-8-unix; -*-
     Danil Kutkevich's reference cards <http://kutkevich.org/rc>.
     Copyright (C) 2007, 2008, 2009, 2010 Danil Kutkevich <danil@kutkevich.org>

     This reference cards is licensed under the Creative Commons
     Attribution-Share Alike 3.0 Unported License. To view a copy of this
     license, see the COPYING file or visit
     <http://creativecommons.org/licenses/by-sa/3.0/> or send a letter to
     Creative Commons, 171 Second Street, Suite 300, San Francisco,
     California, 94105, USA. -->

Rails
=====

Concole
-------

### Redirecting output to a file

<http://stackoverflow.com/questions/2461503/rails-redirecting-console-output-to-a-file>

    $stdout = File.new('console.out', 'w')

Schema
------

    rake RAILS_ENV=production db:schema:load

### Create

    rake db:schema:dump

Other
-----

    mongrel_rails cluster::configure -e production -p 8000 -a 127.0.0.1 \
                  -N 2 -c /home/danil/var/www/hello_rails/current
    rake db:sessions:clear
    rake paperclip:refresh CLASS=YourModelName
    rake rails:freeze:gems
    rake rails:freeze:edge REVISION=1234
    rake rails:freeze:edge TAG=rel_1-2-0
    rake rails:unfreeze
    rake stats
    rake rails:update
