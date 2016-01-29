# SQLite

## List tables

    .tables

## Described table

    .schema your_table_name

## Execute query

    sqlite3 db/development.sqlite3 "SELECT version FROM schema_migrations;"

## Dump

    sqlite3 db/development.sqlite3 < dump.sql
    sqlite3 db/development.sqlite3 .dump > dump.sql
