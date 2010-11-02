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

Mail
----

PROhq mail view test:

    u = User.find_by_email("danil@kutkevich.org")
    p = Project.suitable_for(u)
    SubscriptionMailer.deliver_suitable_projects(u, p)

Other
-----
    rails -d postgresql hello_world
    mongrel_rails cluster::configure -e production -p 8000 -a 127.0.0.1 \
                  -N 2 -c /home/danil/var/www/hello_rails/current
    ruby script/generate scaffold --help
    ruby script/generate scaffold product \
         title:string description:text image_url:string
    ruby script/generate model discount
    ruby script/generate controller admin
    ruby script/generate migration add_price_to_product price:decimal
    cap -T
    cap production deploy
    rake db:migrate VERSION=0
    RAILS_ENV=production rake db:migrate
    rake RAILS_ENV=production db:schema:load
    rake db:sessions:clear
    rake paperclip:refresh CLASS=YourModelName
    rake rails:freeze:gems
    rake rails:freeze:edge REVISION=1234
    rake rails:freeze:edge TAG=rel_1-2-0
    rake rails:unfreeze
    rake stats
    rake rails:update
    cd /path/to/rails/app && \
      /usr/local/bin/rake RAILS_ENV=production mail:fan_news
    piston import git://github.com/rails/rails.git vendor/rails

    # Dump restore.
    rm db/development.sqlite3; rake db:migrate;
    echo "`../../misc/trunk/db/sql.sh`" | sqlite3 db/development.sqlite3;

    Список программ *nix-подобной системы, необходимых для развертывания и
    эксплуатации сайта:
    * make (>= 3.81)
    * gcc
    * gcc-4.1 (>= 4.1.1)
    * linux-kernel-headers (>= 2.6.18)
    * libc6-dev (>= 2.3.6)
    * zlib1g (>= 1.2.3)
    * zlib1g-dev (>= 1.2.3)
    * openssl (0.9.8)
    * libssl0.9.8 (0.9.8)
    * libssl-dev (0.9.8)
    * libreadline5-dev
    * libpq-dev
    * sqlite3
    * libsqlite3-dev
    * libncurses5-dev
    * и тому подобное, что может понадобиться для работы и компиляции программ
    * ruby1.8 (>= 1.8.7-p72)
    * rubygems (>= 1.3.1)
    * gem пакеты для Руби: rails (>= 2.2.2), sqlite3-ruby, mongrel,
    mongrel_cluster, capistrano, capistrano-ext, activerecord, rake,
    maruku и прочие программы и плагины, необходимые для работы Ruby on
    Rails программ
    * perl (>= 5.8.8)
    * python (>= 2.4.4)
    * php5 (>= 5.2.0)
    * модули для PHP: php5-mysql, php5-pgsql, php5-gd, php5-imagick
    * php5-cli (>= 5.2.0)
    * apache2.2 (>= 2.2.3)
    * модули для Апача: mod_proxy_balancer, mod_proxy, mod_proxy_http,
    mod_status, mod_auth_basic, mod_authn_file
    и прочие для авторизации, mod_rewrite, mod_php5
    * mysql5.0 (>= 5.0.32)
    * mysql-client-5.0 (>= 5.0.32)
    * postgresql-8.1 (>= 8.1.11)
    * postgresql-client (>= 8.1.11)
    * subversion
    * cvs (>= 1.12.13)
    * SSH сервер
    * SSH клиент
    * wget
    * curl
    * emacs со скриптами поддержки языков программирования (>= 21.4) желательно

    Программы, скомпилированные и прослушивающие TCP или UDP порты, должны
    быть доступны на соответствующих портах из глобальной сети Интернет.

    Сервер должен иметь достаточное количество оперативной памяти для
    работы Ruby on Rails и PHP программ с учетом числа сетевых
    посетителей.

    Это предварительный список языков программирования, систем управления
    базами данных и программ сопутствующих веб-программированию. Список не
    является конечным и может быть дополнен в ходе работы.

    Если какой-либо пункт окажется недостающим , то понадобится доступ с
    правами суперпользователя.

    Для установки и настройки программ на системе, отличной от Debian 4.0
    потребуется дополнительное время на изучение.
