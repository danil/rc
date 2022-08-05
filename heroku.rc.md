# Heroku

* <https://devcenter.heroku.com/articles/how-heroku-works>
* <https://devcenter.heroku.com/articles/getting-started-with-ruby-o>
* <https://devcenter.heroku.com/articles/getting-started-with-rails4>

All commands can recive `--app your-app-nm`

# Applications

## List

    heroku login
    heroku apps --all

## Init

<https://devcenter.heroku.com/articles/git>

    heroku git:remote -a your-app-nm

## Create

    heroku apps:create --region eu your-app-nm

# Web server

<https://devcenter.heroku.com/articles/getting-started-with-rails4#visit-your-application>

## List

<https://devcenter.heroku.com/articles/getting-started-with-ruby#scale-the-app>

    heroku ps

## Create

Create one web server

<https://devcenter.heroku.com/articles/getting-started-with-ruby#deploy-the-app>
<https://devcenter.heroku.com/articles/getting-started-with-ruby#scale-the-app>

    heroku ps:scale web=1

## Restart

<https://devcenter.heroku.com/articles/dynos#restarting>

    heroku restart

## Stop

<http://stackoverflow.com/questions/2811453/how-to-stop-an-app-on-heroku#10231477>

    heroku ps:scale web=0

## Prevent sleeping

Create second web server to prevent web dynos from sleeping
<https://devcenter.heroku.com/articles/dynos#dyno-sleeping>

    heroku ps:scale web=2

# Worker

Background tasks (delayed_job and so on)

## List

<https://devcenter.heroku.com/articles/getting-started-with-ruby#scale-the-app>

    heroku ps

## Create

Create one web server

    heroku ps:scale worker=1

## Restart

<https://devcenter.heroku.com/articles/dynos#restarting>

    heroku restart

## Stop

<http://stackoverflow.com/questions/2811453/how-to-stop-an-app-on-heroku#10231477>

    heroku ps:scale worker=0

# Rake

<https://devcenter.heroku.com/articles/rake>
<https://devcenter.heroku.com/articles/getting-started-with-rails4#migrate-your-database>

    heroku run rake db:migrate
    heroku run rake db:seed

# Rails console

<https://devcenter.heroku.com/articles/getting-started-with-ruby#start-a-console>

    heroku run rails console

# Config vars

<https://devcenter.heroku.com/articles/config-vars>
<https://devcenter.heroku.com/articles/getting-started-with-ruby#define-config-vars>

## List

    heroku config

## Set/get

    heroku config:set FOO=bar
    heroku config:get FOO

# Logs

## View

<https://devcenter.heroku.com/articles/getting-started-with-ruby#view-logs>
<https://devcenter.heroku.com/articles/logging>

### Last 10

    heroku logs --num 10

### Interactive

    heroku logs --tail

# Custom Domains

<https://devcenter.heroku.com/articles/custom-domains>

## List

    heroku domains

## Add

    heroku domains:add your.tld

## Remove

<https://devcenter.heroku.com/articles/custom-domains#remove-a-domain>

    heroku domains:remove your.tld

## DNS

### Root domain

Naked, bare or root domain have two options:
* Simple redirect to subdomain
* Wired "aliases" <https://devcenter.heroku.com/articles/custom-domains#cname-functionality-at-the-apex>

### Subdomain

    CNAME www example.herokuapp.com.

# Addons

## List

<https://devcenter.heroku.com/articles/getting-started-with-ruby#provision-add-ons>

    heroku addons

### For all apps

    heroku addons --all

## Install

    heroku addons:create your-addon-nm

## Uninstall

    heroku addons:destroy your-addon-nm

# Deploy hook

    heroku addons:create deployhooks:http --url https://your.tld/path-to-your-hook

# PostgreSQL

## Getting started

* <https://devcenter.heroku.com/articles/heroku-postgresql#connecting-in-ruby>
* <https://devcenter.heroku.com/articles/ruby-support#build-behavior>

Should use `DATABASE_URL` environment variable.

## Install

    heroku addons:create heroku-postgresql:hobby-dev --version=9.4

## Debug

<https://devcenter.heroku.com/articles/getting-started-with-ruby#use-a-database>

    heroku pg

## Connect

    heroku pg:psql YOUR_DB_NM

## Execute query

    heroku pg:psql YOUR_DB_NM --command 'SELECT 1 + 1'

## Sql dump

Sql Backup

    pg_dump postgres://your_usr:your_password@your.tld:5432/your_db_nm \
        | xz --compress \
        > path/to/dump_$(hostname)_$(date --utc +%Y%m%dT%H%M%SZ).sql.xz

### Restore

Restore from from sql dump file

<http://stackoverflow.com/questions/20508898/how-can-i-import-a-sql-file-into-my-heroku-postgres-database#20511058>

    heroku pg:psql YOUR_DB_NM < path/to/dump.sql

## Binary dump

### List

    heroku pg:backups

### Create

    heroku pg:backups capture

#### Regular backups

##### List

    heroku pg:backups schedules

##### Create

Scheduling backups

<https://devcenter.heroku.com/articles/heroku-postgres-backups#scheduling-backups>

    heroku pg:backups schedule DATABASE_URL --at '02:00 UTC'

### Restore

    heroku pg:backups restore "http://your.tld/path/to/dump" DATABASE_URL

# Sendgrid

<https://devcenter.heroku.com/articles/sendgrid#provisioning-the-add-on>

## Install

    heroku addons:create sendgrid:starter

# Mandrill

<https://devcenter.heroku.com/articles/mandrill>

    heroku addons:create mandrill:starter

# Rollbar

## Install

<https://devcenter.heroku.com/articles/rollbar#provisioning-the-add-on>
<https://devcenter.heroku.com/articles/rollbar#using-with-ruby-rails>

    heroku addons:create rollbar
    rails generate rollbar

## Access token

Get access token

    heroku config:get ROLLBAR_ACCESS_TOKEN

## Open dashboard

<https://devcenter.heroku.com/articles/rollbar#dashboard>

    heroku addons:open rollbar
