# SQLite

# Tables

## List tables

    .tables

## Described table

    .schema your_table_nm

## Create table

    CREATE TABLE your_table_nm(id INTEGER PRIMARY KEY NOT NULL, nm TEXT);

## Drop table

    DROP TABLE IF EXISTS your_table_nm;

# Query

## Execute query

    sqlite3 db/development.sqlite3 "SELECT version FROM schema_migrations;"

## Dump

    sqlite3 db/development.sqlite3 < dump.sql
    sqlite3 db/development.sqlite3 .dump > dump.sql

# Insert row

    INSERT INTO test_table (name, age) VALUES('John', 3);
    COPY test_table FROM STDIN WITH DELIMITER AS ',';

# Delete row

    DELETE FROM users WHERE id = 3;
