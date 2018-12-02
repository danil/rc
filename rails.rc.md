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

### Migrations

#### Create

    bundle exec bin/rails generate migration YourMigrationName

#### Status

Display status of pending migrations

    rake db:migrate:status

#### Up

    rake db:migrate RAILS_ENV=test

#### Down

<http://guides.rubyonrails.org/active_record_migrations.html#rolling-back>

##### Two steps

    rake db:rollback STEP=2

##### Specific migration

    rake db:rollback VERSION=197001010000

### Schema

#### Load

Load into database

    rake RAILS_ENV=production db:schema:load

#### Create

Create by database

    rake db:schema:dump

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
        your_user_name@your.host.name

On server:

    curl localhost:port_on_server

## Other

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
