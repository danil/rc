# PostgreSQL RDBMS rc

## psql

    psql --host=your.tld --usernm=your_role
    psql --dbname=your_db
    psql dbname
    psql --echo-hidden
    psql --single-transaction

## psql input/output

    psql --file=path/to/file.sql
    cat path/to/file.sql | psql
    psql < path/to/file.sql

## psql print multiline to stdout

    $ psql -qAtX --quiet --no-align --tuples-only --no-psqlrc --command="select E'Your first Line.\nYour second line.';"
    Your first Line.
    Your second line.

## Print to stdout

    man -P cat --pager=cat 
    man ksh | col -b > ksh.txt

## URL

    psql postgres://your_usr:your-password@your.host:5432/your_db

## Create dump by pg_dump

Backuping:

    pg_dump --host=localhost --port=5432 --username=your_role \
            --table="your_tbl" --attribute-inserts your_db \
            | xz --compress > path/to/dump_$(hostname)_$(date --utc +%Y%m%dT%H%M%SZ).sql.xz

## Restore dump by psql

    cat path/to/dump.sql.xz | xz --decompress | psql your_db

## Create dump of all databases by pg_dumpall

    pg_dumpall --host=localhost --port=5432 --username=your_role \
               > path/to/dump_$(hostname)_$(date --utc +%Y%m%dT%H%M%SZ).sql

## Create dump of all databases by pg_dump by URL

    pg_dump postgres://your_usr:your-password@your.host:5432/your_db \
            > path/to/dump.sql

## Create dump of all databases by psql

    \i path/to/dump.sql

## Restor binary dump by pg_restore

    pg_restore --username=your_role --dbname=your_db --no-owner your_file.backup

## Enable sequential scan (default)

    set enable_seqscan = on;

## Disable sequential scan for the debug purpose (index debug)

    set enable_seqscan = off;

## List indexes

    \di
    \d your_tb

## Show/describe index

    SELECT * FROM "pg_indexes" WHERE "tablename" = 'your_tbl';

## Show/describe index size

    \di+ your_idx

## Create index

    CREATE INDEX "your_idx_nm" ON "your_tbl" ("your_col");

This equivalent to (B-tree is default):

    CREATE INDEX "your_idx_nm" ON "your_tbl" USING btree ("your_col");

## Create unique index

    CREATE UNIQUE INDEX "your_idx_nm" ON "your_tbl" ("your_col");

## Create compound index

    CREATE INDEX "your_idx_nm" ON "your_tbl" ("your_col1", "your_col2");

## Create partial index

    CREATE INDEX "your_idx_nm" ON "your_tbl" ("your_col1") WHERE ("your_col2" IS NULL);

## Create index on jsonb

    CREATE INDEX "your_idx_nm" ON "your_tbl" (
           (your_col1->>'your_prop1'),
           (your_col2->>'your_prop2')
    );

## Drop/delete/remove index

    DROP INDEX your_idx_nm;

## Rename index

    ALTER INDEX IF EXISTS "your_idx_nm" RENAME TO "your_idx_new_nm";

## Alter index

    DROP INDEX your_idx_nm;
    CREATE INDEX your_idx_nm ON your_tbl (your_col);

## Indexes usage stats

    SELECT * FROM pg_stat_user_indexes;
    SELECT * FROM pg_statio_user_indexes;

## Statistics

    SELECT * FROM pg_catalog.pg_stats WHERE tablename = 'your_tbl';

## Create enum

    CREATE TYPE your_tbl AS ENUM ('foo','bar','xyz');

## Delete enum

    DROP TYPE your_tbl;

## Change output format

    psql ska_production --no-align --command="SELECT id,name FROM foobars;" \
         | sed G | tr '|' '\n' | sed '/./,/^$/!d'

## Environment variables

<http://www.postgresql.org/docs/current/static/libpq-envars.html>

    PGHOST=localhost \
    PGDATABASE=your-db-nm \
    PGPORT=5433 \
    PGUSER=your-user \
    PGPASSWORD=your-password \
    psql

## Reserved key Words

https://www.postgresql.org/docs/9.4/errcodes-appendix.html

## Server version

```sql
yourdb=> SELECT version();
                               version
----------------------------------------------------------------------
 PostgreSQL 13.6 (Ubuntu 13.6-1.pgdg18.04+1) on x86_64-pc-linux-gnu,
 compiled by gcc (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0, 64-bit

yourdb=> SHOW server_version;
          server_version
----------------------------------
 13.6 (Ubuntu 13.6-1.pgdg18.04+1)

yourdb=> SHOW server_version_num;
 server_version_num
--------------------
 130006
```

## hba_file

Find pg_hba.conf location
<http://askubuntu.com/questions/256534/how-do-i-find-the-path-to-pg-hba-conf-from-the-shell>,
<http://www.postgresql.org/docs/current/static/runtime-config-file-locations.html>

    psql --tuples-only --pset='format=unaligned' --command='show data_directory'

## Roles/users list

    -- \du [PATTERN]
    SELECT * FROM pg_user ORDER BY id DESC LIMIT 1;

## Create role

`CREATE USER` is an alias for `CREATE ROLE`. The only difference is that
when the command is spelled `CREATE USER`, `LOGIN` is assumed by default.

## Create standard user

    CREATE ROLE your_role WITH LOGIN PASSWORD 'password'
    VALID UNTIL '2009-01-01';

    createuser --no-createrole --no-createdb --no-superuser --pwprompt \
               --encrypted --username=your_role --password testuser

## Create Superuser

    CREATE ROLE your_role WITH SUPERUSER LOGIN PASSWORD 'password'
    VALID UNTIL '2009-01-01';

    createuser --superuser --pwprompt --encrypted --username=postgres --password your_role

## Alter/update role

    ALTER ROLE your_role WITH PASSWORD 'your*password';
    ALTER ROLE your_role CREATEDB;
    ALTER ROLE your_role NOCREATEDB;

## Drop/remove role

    DROP ROLE your_role;

## Privileges

Grant privileges to the roles/users

## List roles

List roles and privileges

    \du
    \du+
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

## Grant privileges

    GRANT ALL ON DATABASE your_db TO your_role;
    GRANT SELECT, INSERT, UPDATE, DELETE ON your_db TO your_role;

## Remove privileges

    REVOKE ALL PRIVILEGES ON DATABASE your_db FROM your_role;
    revoke SELECT, INSERT, UPDATE, DELETE ON billing.rebates_agg FROM your_role;

## Get curretn database

    SELECT current_database();

## Database list

    -- \l list all databases (add "+" for more detail)

    SELECT datname FROM pg_database WHERE datistemplate = false;

## Create database

    CREATE DATABASE "your_db"
           WITH OWNER your_role
           ENCODING = 'UTF8'
           LC_COLLATE = 'en_US.UTF-8'
           LC_CTYPE = 'en_US.UTF-8';
    createdb --owner=your_role --username=postgres --password your_db

## Drop database

    DROP DATABASE your_db;
    dropdb --username=your_role --password test

## Get databases owner

    SELECT d.datname as "Name", pg_catalog.pg_get_userbyid(d.datdba) as "Owner"
           FROM pg_catalog.pg_database d WHERE d.datname = 'your_db' ORDER BY 1;

## Copy database

<http://stackoverflow.com/questions/876522/creating-a-copy-of-a-database-in-postgres#876565>

    CREATE DATABASE newdb WITH TEMPLATE originaldb OWNER ownername;

<http://stackoverflow.com/questions/876522/creating-a-copy-of-a-database-in-postgres#6739995>

    createdb -O ownername -T originaldb newdb

## Rename database

    ALTER DATABASE medapp_dev RENAME TO medapp_dev_master;

## Schemas list

    \dn

## List tables within schema

    \dt your_schema.*

## List functions within schema

    \df your_schema.*

## Drop schema

<http://www.postgresql.org/docs/current/static/sql-dropschema.html>

    DROP SCHEMA IF EXISTS your_schema1, your_schema2 CASCADE;

## Default schema

Set a default schema for a session
<http://www.postgresql.org/message-id/200307222318.58234.barwick@gmx.net>,
<http://www.postgresql.org/docs/current/static/ddl-schemas.html#DDL-SCHEMAS-PATH>.

    SET search_path TO "$user",your_schema;

## Sequences list

    \ds

## Get sequence

    SELECT nextval('your_seq');

## Set sequence

    SELECT setval('your_seq', 1234567890, true);

## Reset sequence

    ALTER SEQUENCE your_seq RESTART WITH 1;

## Tables list

    \dt [PATTERN] (add "+" for more detail)

## List tables by the SQL

    SELECT * from information_schema.tables
    WHERE table_name LIKE '%your_tbl%'
          AND table_schema = current_schema();

## Create table

    CREATE TABLE your_tbl
      (some_id BIGSERIAL PRIMARY KEY, name varchar(10), bio text, age integer);

## Show/describe table

    \d some_table

## Show/describe table by the SQL

    SELECT your_col, data_type, character_maximum_length
    FROM information_schema.columns
    WHERE table_name = 'your-tbl-nm';

## Drop table

    DROP TABLE schema_migrations, products;

## Drop all talbles

List all tables then drop them.

    SELECT tablename
    FROM pg_tables
    WHERE tableowner = 'msls' AND schemaname = 'public';

## Add column to table

    ALTER TABLE your_tbl
        ADD COLUMN your_col1 integer NOT NULL DEFAULT 123,
        ADD COLUMN your_col2 timestamp with time zone;

## Remove column

    ALTER TABLE your_tbl DROP COLUMN your_col1, DROP COLUMN your_col2;

## Rename table

    ALTER TABLE your_old_tbl1 RENAME TO your_new_tbl2;

## Rename column

    ALTER TABLE your_tbl RENAME old_nm TO new_nm;

## Change column type

    ALTER TABLE your_tbl ALTER COLUMN col_nm TYPE smallint;
    ALTER TABLE your_tbl ALTER COLUMN col_nm TYPE bigint;

## Add unique constraint

    ALTER TABLE "your_tbl" ADD CONSTRAINT your_cstr UNIQUE (your_col1, your_col2);

## Delete constraint

Remove constraint by name

    ALTER TABLE "your_tbl" DROP CONSTRAINT your_cstr;

## Rename constraint

    ALTER TABLE your_tbl
        RENAME CONSTRAINT your_cstr_old TO your_cstr_new;

## Create temporary table

    CREATE TEMP TABLE your_tbl
      (some_id BIGSERIAL, name varchar(10), bio TEXT, age INTEGER);

## Update data

<http://www.postgresql.org/docs/current/static/sql-update.html>

    UPDATE your_tbl SET foo = 'bar' || id;

## Swap/update two column's values

    UPDATE your_tbl
    SET your_col1 = your_col2,
        your_col2 = your_col1
    WHERE your_col3 IS NOT NULL;

## Multiple updates with subquery

Update multiple rows in one query
<https://stackoverflow.com/questions/18797608/update-multiple-rows-in-same-query-using-postgresql#18799497>

    UPDATE xyz SET foo=subquery.foo, bar=subquery.bar
    FROM (SELECT foo, bar FROM xyz WHERE id = 123) AS subquery
    WHERE id = 321;

## Insert

    INSERT INTO your_tbl (nm, age) VALUES ('John', 3);
    COPY your_tbl FROM STDIN WITH DELIMITER AS ',';

## Upsert/update/insert/create

    INSERT INTO your_tbl ("latitude", "longitude", "nm") 
        VALUES (1 ,2 ,'foobar')
        ON CONFLICT ON CONSTRAINT your_tbl_pkey
            DO UPDATE SET "name" = 'foobar';

## Insert by query

    INSERT INTO your_tbl (id, nm, age)
    SELECT 2, name, age FROM your_tbl WHERE id = 1;

## Increment/upsert/update counter

    INSERT INTO "your_tbl" ("id", "count")
    VALUES (nextval('your_tbl_id_seq'::regclass), 1)
    ON CONFLICT ("id")
    DO UPDATE SET "count" = COALESCE("your_tbl"."count", EXCLUDED."count") + 1;

## Insert/update new line character

    INSERT INTO your_tbl (your_col) VALUES (E'First Line.\nSecond line.');
    UPDATE your_tbl SET your_col = E'First Line.\nSecond line.';

## Delete

    DELETE FROM users WHERE id = 3;

## Delete limit

   WITH del AS (
        SELECT id FROM your_tbl
        WHERE your_col = 'foobar'
        LIMIT 42
   ) DELETE FROM your_tbl
     WHERE id IN (SELECT FROM del);

## Delete union

    DELETE FROM your_tbl
    WHERE your_col IN (
          SELECT your_col AS your_als
                 FROM your_tbl
                 WHERE your_col = 42
                 UNION ALL
          SELECT your_col2 AS your_als
                 FROM your_tbl
                 WHERE your_col = 42
                 UNION ALL
          SELECT your_col3 AS your_als
                 FROM your_tbl
                 WHERE your_col = 42
    ) RETURNING your_col;

## Truncate all data

<http://www.postgresql.org/docs/current/static/sql-truncate.html>

    BEGIN; TRUNCATE your_tbl, your_tbl2 CASCADE; ALTER SEQUENCE your_seq RESTART WITH 1; COMMIT;

## Queries

    SELECT * FROM your_tbl;

## Query/convert timestamp to string

    SELECT to_char(now(), 'YYYY-MM-DD hh24:mi:ss TZ');

## Query/convert unix time to timestamp

    SELECT to_timestamp(1234567890);

## Query/convert string to timestamp

    SELECT to_timestamp('1970-12-31 23:45:01 UTC', 'YYYY-MM-DD hh24:mi:ss TZ');

## Distinct

Remove duplicate rows from the result set (one row is kept from each
group of duplicates).

    SELECT DISTINCT ON (your_col) your_col FROM your_tbl;
    SELECT DISTINCT your_col FROM your_tbl;

## Exclude list condition

<http://www.postgresql.org/docs/current/static/functions-comparisons.html#AEN20298>
<http://www.postgresql.org/docs/current/static/functions.html>

    SELECT * FROM your_tbl1
    WHERE (
           your_col1, your_col2
    ) NOT IN (
           SELECT your_col3, your_col4 FROM your_tbl2
    );

## Array length/count

    SELECT cardinality('{1,2,3}'::smallint[]);
    SELECT array_length('{1,2,3}'::smallint[], 1);

## Array contains

<https://stackoverflow.com/questions/16606357/how-to-make-a-select-with-array-contains-value-clause-in-psql#16606612>

    SELECT * FROM your_tbl WHERE 'your array item' = ANY(your_col);
    SELECT * FROM your_tbl WHERE your_col @> ARRAY['foobar']::text[];
    SELECT * FROM your_tbl WHERE your_col && ARRAY['foo','bar']::text[];

## Array append

    UPDATE your_tbl SET your_col = array_append(your_col, 'new array item');

## Exclude array/not in array condition

<https://stackoverflow.com/questions/11730777/postgres-not-in-array/43380487#11730789>

    SELECT * FROM your_tbl1 WHERE NOT (your_col = ANY ('{0,1,2}'::smallint[]));

## Current date

    mydb=> SELECT current_date;
        date
    ------------
     2002-08-31

## Multiline JSON output to stdout

    $ psql -qAtX --quiet --no-align --tuples-only --no-psqlrc --command="select E'{\n    \"yourKey\": \"Your value\",\n    \"yourKey2\": 42\n}';"
    {
        "yourKey": "Your value",
        "yourKey2": 42
    }

## Arithmetics

    mydb=> SELECT 2 + 2;
     ?column?
    ----------
            4

## Timestamp with timezone type

Today in past year

    SELECT (CURRENT_DATE - INTERVAL '1 year')::timestamptz;
    german_test=# show timezone;

## Show/describe enum type

<http://stackoverflow.com/questions/9535937/is-there-a-way-to-show-a-user-defined-postgresql-enumerated-type-definition#25326877>

    SELECT enum_range(null::my_type);

## Create range

Create dates range from now to 1 year ago

    SELECT tstzrange(
           (CURRENT_DATE - INTERVAL '1 year')::timestamptz,
           CURRENT_DATE,
           '[]'
    );

## Intersection (overlapping)

    SELECT tstzrange('1970-12-31', '2000-12-31', '[]')
        && tstzrange('1970-12-31', '2000-12-31', '[]');

## List functions

List functions in schema `foo`

    \df foo.*

## Extensions list

    \dx
    SELECT * FROM pg_extension;

## Extension create

<http://www.postgresql.org/docs/current/static/sql-createextension.html>

    CREATE EXTENSION IF NOT EXISTS plv8 WITH SCHEMA pg_catalog;

## Single quotes

<http://www.postgresql.org/docs/current/static/sql-syntax-lexical.html#SQL-SYNTAX-STRINGS>

Single quotes used for `string constants`. For example: `'This is a string'`.

## Double quotes

<http://www.postgresql.org/docs/current/static/sql-syntax-lexical.html#SQL-SYNTAX-IDENTIFIERS>

Single quotes used for `identifiers` (like table names). For example:
`UPDATE "your_tbl" SET "a" = 5;`

## Key words

Key words should be escaped (for example if used as table name or column name)
<http://www.postgresql.org/docs/current/static/sql-keywords-appendix.html#KEYWORDS-TABLE>

## Concatenation

<http://www.postgresql.org/docs/9.1/static/functions-string.html#FUNCTIONS-STRING-SQL>

    SELECT 'foo' || 'bar'

<http://www.postgresql.org/docs/9.1/static/functions-string.html#FUNCTIONS-STRING-OTHER>

    SELECT concat('foo', 'bar', 'xyz')

## psql: write to stdout

    \o

## psql: write to file

    \o path/to/your_file

## CSV Export by SQL to STDOUT

    COPY (SELECT your_col1, your_col2 FROM your_tbl)
    TO STDOUT csv DELIMITER ';' NULL AS '\N' QUOTE '"' ESCAPE '\';

## CSV Export by SQL to file

    COPY (SELECT your_col1, your_col2 FROM your_tbl)
    TO 'path/to/file.csv' csv DELIMITER ';' NULL AS '\N' QUOTE '"' ESCAPE '\';

## CSV Export by psql command by SQL to file

    psql --command="COPY (SELECT your_col1, your_col2 FROM your_tbl)
                    TO STDOUT csv DELIMITER ';' NULL AS '\N' QUOTE '"'"'"' ESCAPE '\';"

## CSV import by psql command by SQL from file

Load data from csv file

<http://www.postgresql.org/docs/current/static/sql-copy.html>

    COPY your_tbl (your_col1, your_col2)
    FROM 'path/to/file.csv'
    csv DELIMITER ';' NULL AS '\N' QUOTE '"' ESCAPE '\';

## CSV import by psql command by SQL from STDIN

    cat path/to/file.csv \
    | psql --command="COPY your_tbl (your_col1, your_col2)
                      FROM STDIN
                      csv DELIMITER ';' NULL AS '\N' QUOTE '"'"'"' ESCAPE '\';"

## CSV import by psql command by from file

<http://www.postgresql.org/docs/current/static/app-psql.html#APP-PSQL-META-COMMANDS-COPY>

    \copy your_tbl (your_col1, your_col2)
          FROM 'path/to/file.csv'
          csv DELIMITER ';' NULL AS '\N' QUOTE '"' ESCAPE '\';

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

## Disk usage psql command

<http://stackoverflow.com/questions/2596624/how-do-you-find-the-disk-size-of-a-postgres-postgresql-table-and-its-indexes>

    \l+
    \d+

## Disk usage SQL query

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

## Prepared statement create

<http://www.postgresql.org/docs/current/static/sql-prepare.html>

    PREPARE your_statement_nm (text, int) AS
      SELECT * FROM "your_tbl"
      WHERE "name" = $1 AND "age" = $2;

## Prepared statement execute

    EXECUTE your_statement_nm ('foo', 123);

## Prepared statement delete

<http://www.postgresql.org/docs/current/static/sql-deallocate.html>

    DEALLOCATE your_statement_nm;

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

    SELECT * FROM pg_stat_activity WHERE datname = 'your-db-nm';

## Get locale

    SHOW LC_COLLATE;

## Fix locale

* <http://stackoverflow.com/questions/16736891/pgerror-error-new-encoding-utf8-is-incompatible#16737776>
* <https://wiki.gentoo.org/wiki/PostgreSQL#Changing_the_Default_Encoding_of_New_Databases>
* <https://wiki.archlinux.org/index.php/PostgreSQL#Change_default_encoding_of_new_databases_to_UTF-8>
* <http://www.postgresql.org/message-id/43FE1E65.3030000@genome.chop.edu>
* <http://www.postgresql.org/docs/current/static/multibyte.html#AEN35730>

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

## Reserved key words

<https://www.postgresql.org/docs/current/static/sql-keywords-appendix.html>
