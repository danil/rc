# PostgreSQL

## psql

    psql --host=kutkevich.org.ru --username=your_role
    psql --dbname=your_db
    psql dbname
    psql --echo-hidden
    psql --single-transaction

### Input

    psql --file=path/to/file.sql
    cat path/to/file.sql | psql
    psql < path/to/file.sql

## URL

    psql postgres://your_user:your-password@your.host:5432/your_db

## Dump

### Create

Backuping:

```sh
pg_dump --host=localhost --port=5432 --username=your_role \
        --table="your_tbl" --attribute-inserts your_db \
        | xz --compress > path/to/dump_$(date --utc +%Y%m%dT%H%M%SZ).sql.xz
```

### Restore

    cat path/to/dump.sql.xz | xz --decompress | psql your_db

### Dump all databases

    pg_dumpall --host=localhost --port=5432 --username=your_role \
               > path/to/dump_$(date --utc +%Y%m%dT%H%M%SZ).sql

#### URL

    pg_dump postgres://your_user:your-password@your.host:5432/your_db \
            > path/to/dump.sql

#### psql

    \i path/to/dump.sql

### Restor binary dump

    pg_restore --username=your_role --dbname=your_db --no-owner file.backup

## Indexes

### List indexes

    \di
    \d your_tb

### Show index

```sql
SELECT * FROM "pg_indexes" WHERE "tablename" = 'entities';
```
#### Show index size

    \di+ your_idx

### Create index

```sql
CREATE INDEX idx_name ON your_tbl (your_col);
```

This equivalent to (B-tree is default):

```sql
CREATE INDEX idx_name ON your_tbl USING btree (your_col);
```

#### Create compound index

```sql
CREATE INDEX idx_name ON your_tbl (your_col1,your_col2);
```

### Create partial index

```sql
CREATE INDEX "idx_name" ON "your_tbl" ("your_col1") WHERE ("your_col2" IS NULL);
```

### Drop

```sql
DROP INDEX your_index_neme;
```

### Indexes usage stats

```sql
SELECT * FROM pg_stat_user_indexes;
SELECT * FROM pg_statio_user_indexes;
```

## Enum

### Create

    CREATE TYPE your_tbl AS ENUM ('foo','bar','xyz');

### Delete

    DROP TYPE your_tbl;

## Change output format

    psql ska_production --no-align --command="SELECT id,name FROM foobars;" \
      | sed G | tr '|' '\n' | sed '/./,/^$/!d'

## Environment variables

<http://www.postgresql.org/docs/current/static/libpq-envars.html>

    PGHOST=localhost \
      PGDATABASE=your-db-name \
      PGPORT=5433 \
      PGUSER=your-user \
      PGPASSWORD=your-password \
      psql

## Version

    mydb=> SELECT version();

                                   version
    ----------------------------------------------------------------------
     PostgreSQL 8.1.11 on i486-pc-linux-gnu,
    compiled by GCC cc (GCC) 4.1.2 20061115 (prerelease) (Debian 4.1.1-21)
    (1 row)

## hba_file

Find pg_hba.conf location
<http://askubuntu.com/questions/256534/how-do-i-find-the-path-to-pg-hba-conf-from-the-shell>,
<http://www.postgresql.org/docs/current/static/runtime-config-file-locations.html>

    psql --tuples-only --pset='format=unaligned' --command='show data_directory'

## Roles

### Users list

    -- \du [PATTERN]
    SELECT * FROM pg_user ORDER BY id DESC LIMIT 1;

### Create role

CREATE USER is an alias for CREATE ROLE. The only difference is that
when the command is spelled CREATE USER, LOGIN is assumed by default.

#### Standard user

```sql
CREATE ROLE your_role WITH LOGIN PASSWORD 'password'
VALID UNTIL '2009-01-01';
```

```sh
createuser --no-createrole --no-createdb --no-superuser --pwprompt \
           --encrypted --username=your_role --password testuser
```

#### Superuser

    CREATE ROLE your_role WITH SUPERUSER LOGIN PASSWORD 'password'
    VALID UNTIL '2009-01-01';

    createuser --superuser --pwprompt --encrypted --username=postgres --password your_role

### Alter role

    ALTER ROLE your_role WITH PASSWORD 'znVOIuah';
    ALTER ROLE your_role CREATEDB | NOCREATEDB;

### Drop role

    DROP ROLE your_role;

## Privileges

Grant privileges to the roles/users

## List

List roles and privileges

```sql
SELECT r.rolname,
       r.rolsuper,
       r.rolinherit,
       r.rolcreaterole,
       r.rolcreatedb,
       r.rolcanlogin,
       r.rolconnlimit,
       r.rolvaliduntil,
       ARRAY(SELECT b.rolname
             FROM pg_catalog.pg_auth_members m
             JOIN pg_catalog.pg_roles b ON (m.roleid = b.oid)
             WHERE m.member = r.oid) AS memberof,
       r.rolreplication,
       r.rolbypassrls
FROM pg_catalog.pg_roles r
ORDER BY 1;
```

### Grant privileges

    GRANT ALL ON DATABASE your_db TO your_role;
    GRANT SELECT, INSERT, UPDATE, DELETE ON your_db TO your_role;

### Remove privileges

    REVOKE ALL PRIVILEGES ON DATABASE your_db FROM your_role;
    revoke SELECT, INSERT, UPDATE, DELETE ON billing.rebates_agg FROM your_role;

## Databases

### Database list

    -- \l list all databases (add "+" for more detail)

    SELECT datname FROM pg_database WHERE datistemplate = false;

### Create database

    CREATE DATABASE "your_db" WITH OWNER your_role ENCODING = 'UTF8';
    createdb --owner=your_role --username=postgres --password your_db

### Drop database

    DROP DATABASE your_db;
    dropdb --username=your_role --password test

### Get databases owner

    SELECT d.datname as "Name", pg_catalog.pg_get_userbyid(d.datdba) as "Owner"
           FROM pg_catalog.pg_database d WHERE d.datname = 'your_db' ORDER BY 1;

### Copy database

<http://stackoverflow.com/questions/876522/creating-a-copy-of-a-database-in-postgres#876565>

    CREATE DATABASE newdb WITH TEMPLATE originaldb OWNER ownername;

<http://stackoverflow.com/questions/876522/creating-a-copy-of-a-database-in-postgres#6739995>

    createdb -O ownername -T originaldb newdb

### Rename database

    ALTER DATABASE medapp_dev RENAME TO medapp_dev_master;

## Schemas

### List

    \dn

#### Tables

List all tables in schema

    \dt your_schema.*

#### Functions

List all functions in schema

    \df your_schema.*

### Drop

<http://www.postgresql.org/docs/current/static/sql-dropschema.html>

    DROP SCHEMA IF EXISTS your_first_schema, your_second_schema CASCADE;

### Default schema

Set a default schema for a session
<http://www.postgresql.org/message-id/200307222318.58234.barwick@gmx.net>,
<http://www.postgresql.org/docs/current/static/ddl-schemas.html#DDL-SCHEMAS-PATH>.

    SET search_path TO "$user",your_schema;

## Sequences

### List

    \ds

### Get

```sql
SELECT nextval('your_sequence_name');
```

### Set

```sql
SELECT setval('your_sequence_name', 1234567890, true);
```

## Tables

### Tables list

    \dt [PATTERN] (add "+" for more detail)

#### SQL

List tables by SQL

    SELECT * from information_schema.tables
    WHERE table_name LIKE '%your_tbl%'
          AND table_schema = current_schema();

### Create table

    CREATE TABLE your_tbl
      (some_id SERIAL primary key, name varchar(10), bio TEXT, age INTEGER);

### Describe table

    \d some_table

#### SQL

    SELECT your_col, data_type, character_maximum_length
    FROM information_schema.columns
    WHERE table_name = 'your-table-name';

### Drop table

    DROP TABLE schema_migrations, products;

### Drop all talbles

List all tables then drop them.

    SELECT tablename
    FROM pg_tables
    WHERE tableowner = 'msls' AND schemaname = 'public';

### Add column to table

    ALTER TABLE your_tbl
        ADD COLUMN col1 integer NOT NULL DEFAULT 123,
        ADD COLUMN col2 timestamp with time zone;

### Remove column

    ALTER TABLE your_tbl DROP COLUMN your_col1, DROP COLUMN your_col2;

### Rename table

    ALTER TABLE your_old_tbl1 RENAME TO your_new_tbl2;

### Rename column

    ALTER TABLE your_tbl RENAME old_name TO new_name;

### Change type

    ALTER TABLE your_tbl ALTER COLUMN col_name TYPE smallint;
    ALTER TABLE your_tbl ALTER COLUMN col_name TYPE bigint;

### Add unique constraint

    ALTER TABLE "your_tbl"
        ADD CONSTRAINT your_cstr
            UNIQUE (your_col1, your_col2);

### Delete constraint

Remove constraint by name

    ALTER TABLE "your_tbl" DROP CONSTRAINT your_cstr;

### Rename constraint

    ALTER TABLE your_tbl
        RENAME CONSTRAINT your_cstr_old TO your_cstr_new;

### Temporary tables

#### Create

    CREATE TEMP TABLE your_tbl
      (some_id SERIAL, name varchar(10), bio TEXT, age INTEGER);

## Update

### Update data

<http://www.postgresql.org/docs/current/static/sql-update.html>

    UPDATE your_tbl SET foo = 'bar' || id;

#### Swap two column's values

    UPDATE your_tbl SET col1 = col2, col2 = col1 WHERE col3 IS NOT NULL;

#### multiple rows

Update multiple rows in one query
<https://stackoverflow.com/questions/18797608/update-multiple-rows-in-same-query-using-postgresql#18799497>

#### Subquery

    UPDATE xyz SET foo=subquery.foo, bar=subquery.bar
    FROM (SELECT foo, bar FROM xyz WHERE id = 123) AS subquery
    WHERE id = 321;

## Insert

Insert row

    INSERT INTO your_tbl (name, age) VALUES('John', 3);
    COPY your_tbl FROM STDIN WITH DELIMITER AS ',';

### Update if duplicate

Created or update/update or create

    INSERT INTO your_tbl ("latitude", "longitude", "name") 
        VALUES (1,2,'foobar')
        ON CONFLICT ON CONSTRAINT your_tbl_pkey
            DO UPDATE SET "name" = 'foobar';

### Insert by query

    INSERT INTO your_tbl (id, name, age)
    SELECT 2, name, age FROM your_tbl WHERE id = 1;

## Upsert

Update/insert

### Counter

Update/increment counter or insert initial value 1

```sql
INSERT INTO "your_tbl" ("id", "count")
VALUES(nextval('your_tbl_id_seq'::regclass), 1)
ON CONFLICT ("id")
DO UPDATE SET "count" = COALESCE("your_tbl"."count", EXCLUDED."count") + 1;
```

## Delete row

    DELETE FROM users WHERE id = 3;

## Truncate data

<http://www.postgresql.org/docs/current/static/sql-truncate.html>

    TRUNCATE timeline_items CASCADE;

## Queries

    SELECT * FROM your_tbl;

### Timestamp to datetime

    SELECT *, to_timestamp("created_at") FROM "your_tbl"
        ORDER BY "created_at" DESC;

### Distinct

Remove duplicate rows from the result set (one row is kept from each
group of duplicates).

    SELECT DISTINCT ON (your_col) your_col FROM your_tbl;
    SELECT DISTINCT your_col FROM your_tbl;

### Conditional

#### Exclude list

<http://www.postgresql.org/docs/current/static/functions-comparisons.html#AEN20298>
<http://www.postgresql.org/docs/current/static/functions.html>

    SELECT * FROM your_tbl
    WHERE id NOT IN (1, 2, 3);

### Select array contains

<https://stackoverflow.com/questions/16606357/how-to-make-a-select-with-array-contains-value-clause-in-psql#16606612>

    select * from your_tbl where your_col @> ARRAY[1234567890]::bigint[];

## Current date

    mydb=> SELECT current_date;
        date
    ------------
     2002-08-31
    (1 row)

## Arithmetics

    mydb=> SELECT 2 + 2;
     ?column?
    ----------
            4
    (1 row)

## Types

### Timestamp with timezone

Today in past year

    SELECT (CURRENT_DATE - INTERVAL '1 year')::timestamptz;
    german_test=# show timezone;

### enum

Enumerated

#### Describe

<http://stackoverflow.com/questions/9535937/is-there-a-way-to-show-a-user-defined-postgresql-enumerated-type-definition#25326877>

    SELECT enum_range(null::my_type);

## Ranges

### Create

Create dates range from now to 1 year ago

```sql
SELECT tstzrange(
       (CURRENT_DATE - INTERVAL '1 year')::timestamptz,
       CURRENT_DATE,
       '[]'
);
```

### Intersection (overlapping)

    SELECT tstzrange('1999-01-01', '1999-12-31', '[]')
        && tstzrange('1970-01-01', '2000-12-31', '[]');

## List functions

List functions in schema `foo`

    \df foo.*

## Extensions

### List

    \dx
    SELECT * FROM pg_extension;

### Create

<http://www.postgresql.org/docs/current/static/sql-createextension.html>

    CREATE EXTENSION IF NOT EXISTS plv8 WITH SCHEMA pg_catalog;

## Quotes

Single and double quotes

### Single quotes

<http://www.postgresql.org/docs/current/static/sql-syntax-lexical.html#SQL-SYNTAX-STRINGS>

Single quotes used for `string constants`. For example: `'This is a string'`.

### Double quotes

<http://www.postgresql.org/docs/current/static/sql-syntax-lexical.html#SQL-SYNTAX-IDENTIFIERS>

Single quotes used for `identifiers` (like table names). For example:
`UPDATE "your_tbl" SET "a" = 5;`

#### Key words

Key words should be escaped (for example if used as table name or column name)
<http://www.postgresql.org/docs/current/static/sql-keywords-appendix.html#KEYWORDS-TABLE>

## Concatenation

<http://www.postgresql.org/docs/9.1/static/functions-string.html#FUNCTIONS-STRING-SQL>

    SELECT 'foo' || 'bar'

<http://www.postgresql.org/docs/9.1/static/functions-string.html#FUNCTIONS-STRING-OTHER>

    SELECT concat('foo', 'bar', 'xyz')

## CSV

### Export

```sql
COPY (SELECT * FROM your_tbl)
TO STDOUT csv DELIMITER ';' NULL AS '\N' QUOTE '"' ESCAPE '\';
```

### Import

Load data from csv file

#### SQL

<http://www.postgresql.org/docs/current/static/sql-copy.html>

```sql
COPY your_tbl (first_column, second_column)
FROM 'path/to/file.csv'
csv DELIMITER ';' NULL AS '\N' QUOTE '"' ESCAPE '\';
```

#### psql command

<http://www.postgresql.org/docs/current/static/app-psql.html#APP-PSQL-META-COMMANDS-COPY>

    \copy your_tbl (first_column, second_column) from 'path/to/file.csv';

## Password file

Save password in `~/.pgpass` file and connect without password prompt:

* <http://www.postgresql.org/docs/current/static/libpq-pgpass.html>
* <https://wiki.postgresql.org/wiki/Pgpass>
* <http://dba.stackexchange.com/questions/14740/how-to-use-psql-with-no-password-prompt#14741>

## Current number of connections

Getting the current number of connections in a PostgreSQL

<http://stackoverflow.com/questions/5267715/getting-the-current-number-of-connections-in-a-postgresql-db#5270806>

    SELECT sum(numbackends) FROM pg_stat_database;

## Profiling

Get query execution time/duration

    \timing

## Explain

<http://www.postgresql.org/docs/current/static/sql-explain.html>  
<https://wiki.postgresql.org/wiki/Using_EXPLAIN>

    EXPLAIN SELECT * FROM your_tbl;

### Analyze

    BEGIN;
    EXPLAIN ANALYZE UPDATE your_tbl SET foo = 'bar' || id;
    ROLLBACK;

## Disk usage

### psql command

<http://stackoverflow.com/questions/2596624/how-do-you-find-the-disk-size-of-a-postgres-postgresql-table-and-its-indexes>

    \l+
    \d+

### SQL

`pg_toast` | is an temporary schema (for temporary tables)
-----------|----------------------------------------------

    SELECT nspname || '.' || relname AS "relation",
           pg_size_pretty(pg_relation_size(pg_class.oid)) AS "size"
    FROM pg_class
    LEFT JOIN pg_namespace N ON (N.oid = pg_class.relnamespace)
    WHERE nspname NOT IN ('pg_catalog', 'information_schema', 'pg_toast')
    ORDER BY pg_relation_size(pg_class.oid) DESC
    LIMIT 10;

## Print notice

<http://stackoverflow.com/questions/18828127/how-to-raise-a-notice-in-postgresql#18828523>

    DO language plpgsql $$
    BEGIN
      RAISE NOTICE 'Hello, world!';
    END
    $$;

## Vacuum

<https://wiki.postgresql.org/wiki/Tuning_Your_PostgreSQL_Server#autovacuum>

## Prepared statements

<http://www.postgresql.org/docs/current/static/sql-prepare.html>

### Create

<http://www.postgresql.org/docs/current/static/sql-prepare.html>

    PREPARE your_statement_name (text, int) AS
      SELECT * FROM "your_tbl"
      WHERE "name" = $1 AND "age" = $2;

### Execute

    EXECUTE your_statement_name ('foo', 123);

### Delete

<http://www.postgresql.org/docs/current/static/sql-deallocate.html>

    DEALLOCATE your_statement_name;

## Log all queries

`postgresql.conf`

Log all statements

    line="log_statement = 'all'

Log statements with any durations

    log_min_duration_statement = 0

## pgbench

<http://www.postgresql.org/docs/current/static/pgbench.html>

    pgbench -h localhost -p 51000 -c 1000 -C -S -t 1 \
            -U your_role -f ./pgbouncer/pgbench.sql your_db

    PGPASSWORD=your-password \
      pgbench -h localhost -p 5433 -U your_role \
              -c 100 -C -d -S -t 1000 \
              -f path/to/file.sql your_db

## List active connections

<http://serverfault.com/questions/128284/how-to-see-active-connections-and-current-activity-in-postgresql-8-4#128292>

    SELECT * FROM pg_stat_activity WHERE datname = 'your-db-name';

## Fix PostgreSQL locale

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
CREATE ROLE your_role WITH SUPERUSER LOGIN PASSWORD 'your-password';
CREATE DATABASE your_db WITH OWNER your_role ENCODING = 'UTF8';
```

## Reserved key words

<https://www.postgresql.org/docs/current/static/sql-keywords-appendix.html>
