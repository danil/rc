<!-- -*- coding: utf-8-unix; -*-
     Danil Kutkevich's reference cards <http://kutkevich.org/rc>.
     Copyright (C) 2007, 2008, 2009, 2010 Danil Kutkevich <danil@kutkevich.org>

     This reference cards is licensed under the Creative Commons
     Attribution-Share Alike 3.0 Unported License. To view a copy of this
     license, see the COPYING file or visit
     <http://creativecommons.org/licenses/by-sa/3.0/> or send a letter to
     Creative Commons, 171 Second Street, Suite 300, San Francisco,
     California, 94105, USA. -->

PostgreSQL
==========

    psql --host=kutkevich.org.ru --username=danil --dbname=mydb
    psql --host=kutkevich.org.ru --username=danil dbname < infile
    psql --echo-hidden

Dump
----

Backuping.

    pg_dump --host=localhost --username=danil --table="news" \
            --attribute-inserts ska_production > outfile

Change output format
--------------------

    psql ska_production --no-align --command="SELECT id,name FROM foobars;" \
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

    createuser --createrole --createdb --superuser --pwprompt \
               --encrypted --username=postgres --password danil

### Standard user

    createuser --no-createrole --no-createdb --no-superuser --pwprompt \
               --encrypted --username=danil --password testuser

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

Database list
-------------

    -- \l list all databases (add "+" for more detail)

    SELECT datname FROM pg_database WHERE datistemplate = false;

Create database
---------------

    CREATE DATABASE "danil" WITH OWNER danil ENCODING = 'UTF8';
    createdb --owner=danil --username=postgres --password danil

Drop database
-------------

    DROP DATABASE danil;
    dropdb --username=danil --password test

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

Truncate data
-------------

<http://www.postgresql.org/docs/9.1/static/sql-truncate.html>

    TRUNCATE timeline_items;

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
