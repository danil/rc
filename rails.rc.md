# Rails

## Server

### Connect from remote host

<http://stackoverflow.com/questions/7325663/access-webrick-rails-from-another-computer-on-local-network#28948293>

    rails server --binding=0.0.0.0

## Concole

### Redirecting output to a file

<http://stackoverflow.com/questions/2461503/rails-redirecting-console-output-to-a-file>

    $stdout = File.new('console.out', 'w')

## Database

### Drop/Create

```sh
rake db:drop RAILS_ENV=test
rake db:create RAILS_ENV=test

```

### Migrations

#### Create

    bundle exec bin/rails generate migration YourMigrationName

#### Status

Display status of pending migrations

    bundle exec rake db:migrate:status

#### Up

    bundle exec rake db:migrate RAILS_ENV=test

#### Down

<http://guides.rubyonrails.org/active_record_migrations.html#rolling-back>

##### Two steps

    bundle exec rake db:rollback STEP=2

##### Specific migration

    bundle exec rake db:rollback VERSION=197001010000

### Schema

#### Load

Load into database

    bundle exec rake db:schema:load RAILS_ENV=production

#### Create

Create by database

    bundle exec rake db:schema:dump

## Procfile

`Procfile` is a mechanism for declaring what commands
are run for your application

<https://devcenter.heroku.com/articles/getting-started-with-ruby#run-the-app-locally>
<https://devcenter.heroku.com/articles/procfile>
<https://github.com/ddollar/foreman>

## SSH reverse tunneling

Public access to laptop

<http://tunnelsup.com/raspberry-pi-phoning-home-using-a-reverse-remote-ssh-tunnel>

On laptop:

    ssh -N -R localhost:port_on_server:localhost:port_on_laptop \
        your_usr_name@your.host.name

On server:

    curl localhost:port_on_server

## Other

```sh
mongrel_rails cluster::configure -e production -p 8000 -a 127.0.0.1 \
              -N 2 -c /home/danil/var/www/hello_rails/current
bundle exec rake db:sessions:clear
bundle exec rake paperclip:refresh CLASS=YourMdelNm
bundle exec rake rails:freeze:gems
bundle exec rake rails:freeze:edge REVISION=1234
bundle exec rake rails:freeze:edge TAG=rel_1-2-0
bundle exec rake rails:unfreeze
bundle exec rake stats
bundle exec rake rails:update
```
