<!-- -*- coding: utf-8; -*- -->

# Heroku

# Applications

## List

    heroku login
    heroku apps --all

## Create

    heroku apps:create --region eu your-app-name

# Web server

<https://devcenter.heroku.com/articles/getting-started-with-rails4#visit-your-application>

## Create

Create one web server

    heroku ps:scale web=1

## List

    heroku ps

# Rails

## Migrate

<https://devcenter.heroku.com/articles/getting-started-with-rails4#migrate-your-database>

    heroku run rake db:migrate

## Seed

    heroku run rake db:seed

# Addons

## Creat

    heroku addons:add heroku-postgresql --app your-app-name --version=9.4

# PostgreSQL

## Connect

    heroku pg:psql --app your-app-name YOUR_DB_NAME

## Execute query

    pg:psql --app your-app-name YOUR_DB_NAME --command 'SELECT 1 + 1'

## Sql dump

### Restore

Restore from from sql dump file

<http://stackoverflow.com/questions/20508898/how-can-i-import-a-sql-file-into-my-heroku-postgres-database#20511058>

    heroku pg:psql --app your-app-name YOUR_DB_NAME < path/to/dump.sql
