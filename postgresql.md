# PostgreSQL

## psql

    psql --host=kutkevich.org.ru --username=your_role_name
    psql --dbname=your_db_name
    psql dbname
    psql --echo-hidden
    psql --single-transaction

### Input

    psql --file=path/to/file.sql
    cat path/to/file.sql | psql
    psql < path/to/file.sql

## URL

    psql postgres://your_user_name:your-password@your.host:5432/your_db_name

# Dump

## Create

Backuping:

    pg_dump --host=localhost --username=your_role_name \
            --table="your_table_name" --attribute-inserts your_db_name \
            | xz --compress > path/to/dump_$(date +%Y%m%d%H%M%S%Z).sql.xz

## Restore

    cat path/to/dump.sql.xz | xz --decompress | psql dbname

### URL

    pg_dump postgres://your_user_name:your-password@your.host:5432/your_db_name \
            > path/to/dump.sql

### psql

    \i path/to/dump.sql

## Restor binary dump

    pg_restore --dbname=scheduler_development scheduler.backup

# Change output format

    psql ska_production --no-align --command="SELECT id,name FROM foobars;" \
     | sed G | tr '|' '\n' | sed '/./,/^$/!d'

# Environment variables

<http://www.postgresql.org/docs/current/static/libpq-envars.html>

    PGHOST=localhost \
      PGDATABASE=your-db-name \
      PGPORT=5433 \
      PGUSER=your-user \
      PGPASSWORD=your-password \
      psql

# Version

    mydb=> SELECT version();

                                   version
    ----------------------------------------------------------------------
     PostgreSQL 8.1.11 on i486-pc-linux-gnu,
    compiled by GCC cc (GCC) 4.1.2 20061115 (prerelease) (Debian 4.1.1-21)
    (1 row)


# hba_file

Find pg_hba.conf location
<http://askubuntu.com/questions/256534/how-do-i-find-the-path-to-pg-hba-conf-from-the-shell>,
<http://www.postgresql.org/docs/current/static/runtime-config-file-locations.html>

    psql --tuples-only --pset='format=unaligned' --command='show data_directory'

# Roles

## Users list

    -- \du [PATTERN]
    SELECT * FROM pg_user ORDER BY id DESC LIMIT 1;

## Create role

CREATE USER is an alias for CREATE ROLE. The only difference is that
when the command is spelled CREATE USER, LOGIN is assumed by default.


### Standard user

    CREATE ROLE your_role_name WITH LOGIN PASSWORD 'password'
    VALID UNTIL '2009-01-01';

    createuser --no-createrole --no-createdb --no-superuser --pwprompt \
               --encrypted --username=your_role_name --password testuser

### Superuser

    CREATE ROLE your_role_name WITH SUPERUSER LOGIN PASSWORD 'password'
    VALID UNTIL '2009-01-01';

    createuser --createrole --createdb --superuser --pwprompt \
               --encrypted --username=postgres --password your_role_name

## Alter role

    ALTER ROLE your_role_name WITH PASSWORD 'znVOIuah';
    ALTER ROLE your_role_name CREATEDB | NOCREATEDB;

## Drop role

    DROP ROLE your_role_name;

## Grant privileges

    GRANT ska_phpbb3 to skaforum;

## Remove privileges

    REVOKE ALL PRIVILEGES ON DATABASE ska_phpbb3 FROM skaforum;

# Databases

## Database list

    -- \l list all databases (add "+" for more detail)

    SELECT datname FROM pg_database WHERE datistemplate = false;

## Create database

    CREATE DATABASE "your_db_name" WITH OWNER your_role_name ENCODING = 'UTF8';
    createdb --owner=your_role_name --username=postgres --password your_db_name

## Drop database

    DROP DATABASE your_db_name;
    dropdb --username=your_role_name --password test

## Copy database

<http://stackoverflow.com/questions/876522/creating-a-copy-of-a-database-in-postgres#876565>

    CREATE DATABASE newdb WITH TEMPLATE originaldb OWNER ownername;

<http://stackoverflow.com/questions/876522/creating-a-copy-of-a-database-in-postgres#6739995>

    createdb -O ownername -T originaldb newdb

## Rename database

    ALTER DATABASE medapp_dev RENAME TO medapp_dev_master;

# Schemas

## List

    \dn

### Tables

List all tables in schema

    \dt schema_name.*

### Functions

List all functions in schema

    \df schema_name.*

## Drop

<http://www.postgresql.org/docs/current/static/sql-dropschema.html>

    DROP SCHEMA IF EXISTS your_first_schema, your_second_schema CASCADE;

## Default schema

Set a default schema for a session
<http://www.postgresql.org/message-id/200307222318.58234.barwick@gmx.net>,
<http://www.postgresql.org/docs/current/static/ddl-schemas.html#DDL-SCHEMAS-PATH>.

    SET search_path TO "$user",your_schema_name;

# Sequences

## List

    \ds

# Tables

## Tables list

    \dt [PATTERN] (add "+" for more detail)

### SQL

List tables by SQL

    SELECT * from information_schema.tables
    WHERE table_name LIKE '%your_table_name%'
          AND table_schema = current_schema();

## Create table

    CREATE TABLE test_table
      (some_id SERIAL, name varchar(10), bio TEXT, age INTEGER);

## Describe table

    \d some_table

### SQL

    SELECT column_name, data_type, character_maximum_length
    FROM information_schema.columns
    WHERE table_name = 'your-table-name';

## Drop table

    DROP TABLE schema_migrations, products;

## Drop all talbles

List all tables then drop them.

    SELECT tablename
    FROM pg_tables
    WHERE tableowner = 'msls' AND schemaname = 'public';

## Add column to table

    ALTER TABLE my_table_name ADD COLUMN deleted_at timestamp with time zone;

## Temporary tables

### Create

    CREATE TEMP TABLE your_table_name
      (some_id SERIAL, name varchar(10), bio TEXT, age INTEGER);

# Updates

## Update data

<http://www.postgresql.org/docs/current/static/sql-update.html>

    UPDATE test_table SET foo = 'bar' || id;

### Subquery

    UPDATE xyz SET foo=subquery.foo, bar=subquery.bar
    FROM (SELECT foo, bar FROM xyz WHERE id = 123) AS subquery
    WHERE id = 321;

# Insert row

    INSERT INTO test_table (name, age) VALUES('John', 3);
    COPY test_table FROM STDIN WITH DELIMITER AS ',';

# Delete row

    DELETE FROM users WHERE id = 3;

# Truncate data

<http://www.postgresql.org/docs/current/static/sql-truncate.html>

    TRUNCATE timeline_items CASCADE;

# Queries

    SELECT * FROM test_table;

## Distinct

Remove duplicate rows from the result set (one row is kept from each
group of duplicates).

    SELECT DISTINCT ON (my_column_name) my_column_name FROM my_table_name;
    SELECT DISTINCT my_column_name FROM my_table_name;

## Conditional

### Exclude list

<http://www.postgresql.org/docs/current/static/functions-comparisons.html#AEN20298>
<http://www.postgresql.org/docs/current/static/functions.html>

    SELECT * FROM your_table_name
    WHERE id NOT IN (1, 2, 3);

# Current date

    mydb=> SELECT current_date;
        date
    ------------
     2002-08-31
    (1 row)

# Arithmetics

    mydb=> SELECT 2 + 2;
     ?column?
    ----------
            4
    (1 row)

# Types

## Timestamp with timezone

Today in past year

    SELECT (CURRENT_DATE - INTERVAL '1 year')::timestamptz;

## enum

Enumerated

### Describe

<http://stackoverflow.com/questions/9535937/is-there-a-way-to-show-a-user-defined-postgresql-enumerated-type-definition#25326877>

    SELECT enum_range(null::my_type);

# Ranges

## Create

Create dates range from now to 1 year ago

    SELECT tstzrange(
      (CURRENT_DATE - INTERVAL '1 year')::timestamptz,
      CURRENT_DATE,
      '[]'
    );

## Intersection (overlapping)

    SELECT tstzrange('1999-01-01', '1999-12-31', '[]')
        && tstzrange('1970-01-01', '2000-12-31', '[]');

# List functions

List functions in schema `foo`

    \df foo.*

# Extensions

## List

    \dx
    SELECT * FROM pg_extension;

## Create

<http://www.postgresql.org/docs/current/static/sql-createextension.html>

    CREATE EXTENSION IF NOT EXISTS plv8 WITH SCHEMA pg_catalog;

# Quotes

Single and double quotes

## Single quotes

<http://www.postgresql.org/docs/current/static/sql-syntax-lexical.html#SQL-SYNTAX-STRINGS>

Single quotes used for `string constants`. For example: `'This is a string'`.

## Double quotes

<http://www.postgresql.org/docs/current/static/sql-syntax-lexical.html#SQL-SYNTAX-IDENTIFIERS>

Single quotes used for `identifiers` (like table names). For example:
`UPDATE "my_table" SET "a" = 5;`

### Key words

Key words should be escaped (for example if used as table name or column name)
<http://www.postgresql.org/docs/current/static/sql-keywords-appendix.html#KEYWORDS-TABLE>

# Concatenation

<http://www.postgresql.org/docs/9.1/static/functions-string.html#FUNCTIONS-STRING-SQL>

    SELECT 'foo' || 'bar'

<http://www.postgresql.org/docs/9.1/static/functions-string.html#FUNCTIONS-STRING-OTHER>

    SELECT concat('foo', 'bar', 'xyz')

# CSV

Load data from csv file

## SQL

<http://www.postgresql.org/docs/current/static/sql-copy.html>

    COPY your_table_name (first_column, second_column)
    FROM 'path/to/file.csv';

## psql command

<http://www.postgresql.org/docs/current/static/app-psql.html#APP-PSQL-META-COMMANDS-COPY>

    \copy your_table_name (first_column, second_column) from 'path/to/file.csv';

# Password file

Save password in `~/.pgpass` file and connect without password prompt:

* <http://www.postgresql.org/docs/current/static/libpq-pgpass.html>
* <https://wiki.postgresql.org/wiki/Pgpass>
* <http://dba.stackexchange.com/questions/14740/how-to-use-psql-with-no-password-prompt#14741>

# Current number of connections

Getting the current number of connections in a PostgreSQL

<http://stackoverflow.com/questions/5267715/getting-the-current-number-of-connections-in-a-postgresql-db#5270806>

    SELECT sum(numbackends) FROM pg_stat_database;

# Profiling

    \timing

# Explain

<http://www.postgresql.org/docs/current/static/sql-explain.html>  
<https://wiki.postgresql.org/wiki/Using_EXPLAIN>

    EXPLAIN SELECT * FROM test_table;

## Analyze

    BEGIN;
    EXPLAIN ANALYZE UPDATE test_table SET foo = 'bar' || id;
    ROLLBACK;

# Disk usage

## psql command

<http://stackoverflow.com/questions/2596624/how-do-you-find-the-disk-size-of-a-postgres-postgresql-table-and-its-indexes>

    \l+
    \d+

## SQL

`pg_toast` | is an temporary schema (for temporary tables)
-----------|----------------------------------------------

    SELECT nspname || '.' || relname AS "relation",
           pg_size_pretty(pg_relation_size(pg_class.oid)) AS "size"
    FROM pg_class
    LEFT JOIN pg_namespace N ON (N.oid = pg_class.relnamespace)
    WHERE nspname NOT IN ('pg_catalog', 'information_schema', 'pg_toast')
    ORDER BY pg_relation_size(pg_class.oid) DESC
    LIMIT 10;

# Print notice

<http://stackoverflow.com/questions/18828127/how-to-raise-a-notice-in-postgresql#18828523>

    DO language plpgsql $$
    BEGIN
      RAISE NOTICE 'Hello, world!';
    END
    $$;

# Vacuum

<https://wiki.postgresql.org/wiki/Tuning_Your_PostgreSQL_Server#autovacuum>

# Prepared statements

<http://www.postgresql.org/docs/current/static/sql-prepare.html>

## Create

<http://www.postgresql.org/docs/current/static/sql-prepare.html>

    PREPARE your_statement_name (int, text) AS
      SELECT * FROM "your_table_name" WHERE id = $1 ORDER BY $2;

## Execute

    EXECUTE your_statement_name (123, 'created_at DESC');

## Delete

<http://www.postgresql.org/docs/current/static/sql-deallocate.html>

    DEALLOCATE your_statement_name;

# Log all queries

`postgresql.conf`

Log all statements

    line="log_statement = 'all'

Log statements with any durations

    log_min_duration_statement = 0

# pgbench

<http://www.postgresql.org/docs/current/static/pgbench.html>

    pgbench -h localhost -p 51000 -c 1000 -C -S -t 1 \
            -U your_role_name -f ./pgbouncer/pgbench.sql your_db_name

    PGPASSWORD=your-password \
      pgbench -h localhost -p 5433 -U your_role_name \
              -c 100 -C -d -S -t 1000 \
              -f path/to/file.sql your_db_name

# List active connections

<http://serverfault.com/questions/128284/how-to-see-active-connections-and-current-activity-in-postgresql-8-4#128292>

    SELECT * FROM pg_stat_activity WHERE datname = 'your-db-name';

# Fix PostgreSQL locale

* <http://stackoverflow.com/questions/16736891/pgerror-error-new-encoding-utf8-is-incompatible#16737776>
* <https://wiki.gentoo.org/wiki/PostgreSQL#Changing_the_Default_Encoding_of_New_Databases>
* <https://wiki.archlinux.org/index.php/PostgreSQL#Change_default_encoding_of_new_databases_to_UTF-8>
* <http://www.postgresql.org/message-id/43FE1E65.3030000@genome.chop.edu>
* <http://www.postgresql.org/docs/current/static/multibyte.html#AEN35730>

```sql
UPDATE pg_database SET datistemplate = FALSE WHERE datname = 'template1';
DROP DATABASE template1;
CREATE DATABASE template1
       WITH TEMPLATE = template0
            ENCODING = 'UNICODE'
            LC_COLLATE='en_US.UTF-8'
            LC_CTYPE='en_US.UTF-8';
UPDATE pg_database SET datistemplate = TRUE WHERE datname = 'template1';
CREATE ROLE your_role_name WITH SUPERUSER LOGIN PASSWORD 'your-password';
CREATE DATABASE your_db_name WITH OWNER your_role_name ENCODING = 'UTF8';
```
