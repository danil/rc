<!-- -*- coding: utf-8; -*- -->

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

### Restor binary dump

    pg_restore --dbname=scheduler_development scheduler.backup

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


hba_file
--------

Find pg_hba.conf location
<http://askubuntu.com/questions/256534/how-do-i-find-the-path-to-pg-hba-conf-from-the-shell>,
<http://www.postgresql.org/docs/current/static/runtime-config-file-locations.html>

    psql --tuples-only --pset='format=unaligned' --command='show data_directory'

Create role
-----------

CREATE USER is an alias for CREATE ROLE. The only difference is that
when the command is spelled CREATE USER, LOGIN is assumed by default.


### Standard user

    CREATE ROLE danil WITH LOGIN PASSWORD 'password'
    VALID UNTIL '2009-01-01';

    createuser --no-createrole --no-createdb --no-superuser --pwprompt \
               --encrypted --username=danil --password testuser

### Superuser

    CREATE ROLE danil WITH SUPERUSER LOGIN PASSWORD 'password'
    VALID UNTIL '2009-01-01';

    createuser --createrole --createdb --superuser --pwprompt \
               --encrypted --username=postgres --password danil

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

Copy database
-------------

<http://stackoverflow.com/questions/876522/creating-a-copy-of-a-database-in-postgres#876565>

    CREATE DATABASE newdb WITH TEMPLATE originaldb OWNER ownername;

<http://stackoverflow.com/questions/876522/creating-a-copy-of-a-database-in-postgres#6739995>

    createdb -O ownername -T originaldb newdb

Rename database
---------------

    ALTER DATABASE medapp_dev RENAME TO medapp_dev_master;

Schema
------

### List

    \dn

### List talbles in schema

    \dt schema_name.*

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

Drop all talbles
----------------

List all tables then drop them.

    SELECT tablename
    FROM pg_tables
    WHERE tableowner = 'msls' AND schemaname = 'public'

Add column to table
-------------------

    ALTER TABLE my_table_name ADD COLUMN deleted_at timestamp with time zone;

Update data
-----------

<http://www.postgresql.org/docs/9.3/static/sql-update.html>

    UPDATE test_table SET foo = 'bar' || id;

### Subquery

    UPDATE xyz SET foo=subquery.foo, bar=subquery.bar
    FROM (SELECT foo, bar FROM xyz WHERE id = 123) AS subquery
    WHERE id = 321;

Insert row
----------

    INSERT INTO test_table (name, age) VALUES('John', 3);
    COPY test_table FROM STDIN WITH DELIMITER AS ',';

Delete row
----------

    delete from users where id = 3;

Truncate data
-------------

<http://www.postgresql.org/docs/9.1/static/sql-truncate.html>

    TRUNCATE timeline_items CASCADE;

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

Distinct
--------

Remove duplicate rows from the result set (one row is kept from each
group of duplicates).

    SELECT DISTINCT ON (my_column_name) my_column_name FROM my_table_name;

Types
-----

### Timestamp with timezone

Today in past year

    select (CURRENT_DATE - INTERVAL '1 year')::timestamptz;

### enum

Enumerated

#### Describe

<http://stackoverflow.com/questions/9535937/is-there-a-way-to-show-a-user-defined-postgresql-enumerated-type-definition#25326877>

    select enum_range(null::my_type)

List functions
--------------

List functions in schema `foo`

    \df foo.*

Profiling
---------

    \timing

Explain
-------

<http://www.postgresql.org/docs/current/static/sql-explain.html>  
<https://wiki.postgresql.org/wiki/Using_EXPLAIN>

    EXPLAIN SELECT * FROM test_table;

### Analyze

    BEGIN;
    EXPLAIN ANALYZE UPDATE test_table SET foo = 'bar' || id;
    ROLLBACK;
