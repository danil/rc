<!-- -*- coding: utf-8; -*- -->

# Heroku

* <https://devcenter.heroku.com/articles/how-heroku-works>
* <https://devcenter.heroku.com/articles/getting-started-with-ruby-o>
* <https://devcenter.heroku.com/articles/getting-started-with-rails4>

# Applications

## List

    heroku login
    heroku apps --all

## Init

<https://devcenter.heroku.com/articles/git>

    heroku git:remote -a your-app-name

## Create

    heroku apps:create --region eu your-app-name

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

    heroku restart -a your-app-name

## Stop

<http://stackoverflow.com/questions/2811453/how-to-stop-an-app-on-heroku#10231477>

    heroku ps:scale web=0

## Prevent sleeping

Create second web server to prevent web dynos from sleeping
<https://devcenter.heroku.com/articles/dynos#dyno-sleeping>

    heroku ps:scale web=2

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

    heroku domains:add example.org

## Remove

<https://devcenter.heroku.com/articles/custom-domains#remove-a-domain>

    heroku domains:remove example.com

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

## Create

### PostgreSQL

    heroku addons:add heroku-postgresql --app your-app-name --version=9.4

### Deploy hook

    heroku addons:create deployhooks:http --url https://example.org/path-to-your-hook

# PostgreSQL

## Getting started

* <https://devcenter.heroku.com/articles/heroku-postgresql#connecting-in-ruby>
* <https://devcenter.heroku.com/articles/ruby-support#build-behavior>

Should use `DATABASE_URL` environment variable.

## Debug

<https://devcenter.heroku.com/articles/getting-started-with-ruby#use-a-database>

    heroku pg

## Connect

    heroku pg:psql --app your-app-name YOUR_DB_NAME

## Execute query

    heroku pg:psql --app your-app-name YOUR_DB_NAME --command 'SELECT 1 + 1'

## Sql dump

### Restore

Restore from from sql dump file

<http://stackoverflow.com/questions/20508898/how-can-i-import-a-sql-file-into-my-heroku-postgres-database#20511058>

    heroku pg:psql --app your-app-name YOUR_DB_NAME < path/to/dump.sql

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
