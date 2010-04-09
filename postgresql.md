<!-- -*- coding: utf-8; -*- -->
PostgreSQL
==========

    psql -h kutkevich.org.ru -U danil -d mydb
    psql -h kutkevich.org.ru -U danil dbname < infile
    psql -E

Dump
----

    pg_dump -h localhost -U danil --table="news" --attribute-inserts \
     ska_production > outfile

Change output format
--------------------

    psql ska_production -A -c "SELECT id,name FROM foobars;" \
     |sed G |tr '|' '\n' |sed '/./,/^$/!d'

Version
-------

    mydb=> SELECT version();

                                   version
    ----------------------------------------------------------------------
     PostgreSQL 8.1.11 on i486-pc-linux-gnu,
    compiled by GCC cc (GCC) 4.1.2 20061115 (prerelease) (Debian 4.1.1-21)
    (1 row)

Create role
-----------

CREATE USER is an alias for CREATE ROLE. The only difference is that
when the command is spelled CREATE USER, LOGIN is assumed by default.


    CREATE ROLE danil WITH LOGIN PASSWORD 'Hsdglk1d'
    VALID UNTIL '2009-01-01';

### Superuser

The command line option `-a` specifies that this user can add other
users. `-d` means that this user can create databases. `-P` let's you
enter a password for the user and `-E` will encrypt it for security
purposes.

    createuser -a -d -P -E -U postgres -W danil

### Standard user

`-A` and `-D` options do the opposite of `-a` and `-d`, and instead
deny the user the ability to create other users and databases.

    createuser -A -D -P -E -U danil -W testuser

Alter role
----------

    ALTER ROLE danil WITH PASSWORD 'znVOIuah';
    ALTER ROLE danil CREATEDB | NOCREATEDB;

Drop role
---------

    DROP ROLE jonathan;

Grant privileges
----------------

    GRANT ska_phpbb3 to skaforum;

Remove privileges
-----------------

    REVOKE ALL PRIVILEGES ON DATABASE ska_phpbb3 FROM skaforum;

Show users
----------

    -- \du [PATTERN]
    SELECT * FROM pg_user ORDER BY id DESC LIMIT 1;

    -- \l list all databases (add "+" for more detail)

Create database
---------------

    CREATE DATABASE "danil" WITH OWNER danil ENCODING = 'UTF8';

`-W` option to request the password.

    createdb -O danil -U postgres -W danil

Drop database
-------------

    DROP DATABASE danil;

`-W` option to request the password.

    dropdb -U danil -W test

Tables list
-----------

    \dt [PATTERN] (add "+" for more detail)

Create table
------------

    CREATE TABLE test_table (some_id SERIAL, name TEXT, age INTEGER);

Describe table
--------------

    \d some_table

Drop table
----------

    DROP TABLE schema_migrations, products;

Insert data
-----------

    INSERT INTO test_table (name, age) VALUES('John', 3);
    COPY test_table FROM STDIN WITH DELIMITER AS ',';

Query data
----------

    SELECT * FROM test_table;

Current date
------------

    mydb=> SELECT current_date;
        date
    ------------
     2002-08-31
    (1 row)

Arithmetics
-----------

    mydb=> SELECT 2 + 2;
     ?column?
    ----------
            4
    (1 row)
