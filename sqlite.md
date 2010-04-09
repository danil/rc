SQLite
======

sqlite3 db/development.sqlite3 "SELECT version FROM schema_migrations;"

Dump
----

sqlite3 db/development.sqlite3 < dump.sql
sqlite3 db/development.sqlite3 .dump > dump.sql
