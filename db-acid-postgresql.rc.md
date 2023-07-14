# PostgreSQL RDBMS rc

## psql

    psql --host=your.tld --usernm=your_role
    psql --dbname=your_db
    psql dbname
    psql --echo-hidden
    psql --single-transaction

## psql input from file

    psql --file=path/to/file.sql
    cat path/to/file.sql | psql
    psql < path/to/file.sql

## psql output to file

    psql -o path/to/file.sql
    psql --output=path/to/file.sql

## psql print multiline to stdout

    $ psql -qAtX --quiet --no-align --tuples-only --no-psqlrc --command="select E'Your first Line.\nYour second line.';"
    Your first Line.
    Your second line.

## Print to stdout

    man -P cat --pager=cat 
    man ksh | col -b > ksh.txt

## URL

    psql postgres://your_usr:your-password@your.host:5432/your_db

## Maximum query size/length limit

Limited to 1 gigabyte (2^30) in size, minus 1 byte for a terminating null byte
<https://doxygen.postgresql.org/memutils_8h.html>.

    #define     MaxAllocSize   ((Size) 0x3fffffff) /* 1 gigabyte - 1 */

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

## Primary key/identifier

1. `SELECT gen_random_uuid();` supersedes `SELECT uuid_generate_v4();`
2. `SELECT idkit_uuidv7_generate();` and `SELECT idkit_uuidv6_generate();` is a [rfc 4122][]
3. `SELECT idkit_nanoid_generate();`
4. `SELECT idkit_ksuid_generate();`
5. `SELECT idkit_ulid_generate();`
6. `SELECT idkit_timeflake_generate();` inspired by Twitter's Snowflake, Instagram's ID and Firebase's PushID
7. `SELECT idkit_pushid_generate();`
8. `SELECT idkit_xid_generate();`
9. `SELECT idkit_cuid_generate();`

## Primary key/identifier [rfc 4122][] UUIDv6/UUIDv7/UUIDv8

[pg_idkit][] is a PostgreSQL extension for generating UUID by [pgx framework][]
<https://supabase.com/blog/choosing-a-postgres-primary-key>.

[pg_idkit]: https://github.com/vadosware/pg_idkit
[pgx framework]: https://github.com/tcdi/pgx
[rfc 4122]: https://datatracker.ietf.org/doc/html/draft-peabody-dispatch-new-uuid-format-04

## Random integer/int4

    SELECT floor(random() * 2147483647 + 1)::bigint;

## Random bigint/int8

    SELECT floor(random() * 9223372036854775807 + 1)::bigint;

## Array

    SELECT ARRAY['foo','bar'];
    SELECT '{1,2,3}'::smallint[];

## Array length/size

    SELECT array_upper(ARRAY['foo','bar'], 1);

## Array get firt element

    SELECT (ARRAY['foo','bar'])[1];

## Array get last element

    SELECT (ARRAY['foo','bar'])[array_upper(ARRAY['foo','bar'], 1)];

## Array from multiple rows

    SELECT ARRAY(SELECT id FROM your_tbl)::integer[];
    --  array
    -- -------
    --  {1,2,3}

## Array to multiple rows

<https://stackoverflow.com/questions/7309568/unwrap-postgresql-array-into-rows#21933908>

    SELECT unnest(ARRAY['Alice','Bob','Carol']) AS name;
    --  name
    -- -------
    --  Alice
    --  Bob
    --  Carol
    -- (3 rows)

## Unnest array alongside other column

    SELECT id, unnest(your_col) FROM your_tbl;
    --  id | your_col
    -- ----+----------
    --  42 | 1
    --  42 | 2
    --  42 | 3
    -- ...

## Array length/count

    SELECT cardinality('{1,2,3}'::smallint[]);
    SELECT array_length('{1,2,3}'::smallint[], 1);

## Array contains <sup>[1][array contains stackoverflow] [2][array contains doc en] [3][array contains doc ru]</sup>

    SELECT * FROM your_tbl WHERE 'your array item' = ANY(your_col);
    SELECT * FROM your_tbl WHERE your_col @> ARRAY['foobar']::text[];
    SELECT * FROM your_tbl WHERE your_col && ARRAY['foo','bar']::text[];

[array contains stackoverflow]: <https://stackoverflow.com/questions/16606357/how-to-make-a-select-with-array-contains-value-clause-in-psql#16606612>
[array contains doc en]: <https://www.postgresql.org/docs/current/functions-array.html>
[array contains doc ru]: <https://postgrespro.ru/docs/postgrespro/15/functions-array>

## Arrays contains/overlaps

<https://stackoverflow.com/questions/21742929/postgresql-check-if-array-contains-any-element-from-left-hand-array#21743100>

    SELECT ARRAY[1,2] && ARRAY[1,3,4,7];

## Array append

    UPDATE your_tbl SET your_col = array_append(your_col, 'new array item');

## Exclude array/not in array condition

<https://stackoverflow.com/questions/11730777/postgres-not-in-array/43380487#11730789>

    SELECT * FROM your_tbl1 WHERE NOT (your_col = ANY ('{0,1,2}'::smallint[]));

## Exclude first array from second array

    WITH your_arr1 AS (
         SELECT unnest(ARRAY[3,4]::integer[]) AS your_col
    ),   your_arr2 AS (
        (SELECT unnest(ARRAY[1,2,3,4]::integer[]) AS your_col)
         EXCEPT ALL
        (SELECT * FROM your_arr1)
    ) SELECT ARRAY(SELECT * FROM your_arr2)::integer[];
    --  array
    -- -------
    --  {1,2}

## Exclude first array within column from second array

    WITH your_cte1 AS (
         SELECT your_col1,
                unnest(your_col2) AS your_col2
         FROM your_tbl1
         LIMIT 123
    ),   your_cte2 AS (
        (SELECT your_col1,
                unnest(your_col2) AS your_col2
         FROM your_tbl1
        ) EXCEPT ALL (
         SELECT your_col1,
                unnest(your_col2) AS your_col2
         FROM your_tbl1
        ) ORDER BY your_col1
         LIMIT 321
    ) SELECT * FROM your_cte2;

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

## Timestamp/datetime convert/format to string

    SELECT to_char(now(), 'YYYY-MM-DD hh24:mi:ss TZ');

## Timestamp convert to unix time

    SELECT to_timestamp(1234567890);

## Timestamp parse from string

    SELECT to_timestamp('1970-12-31 23:45:01 UTC', 'YYYY-MM-DD hh24:mi:ss TZ');

## Timestamp today in past year

    SELECT (CURRENT_DATE - INTERVAL '1 year')::timestamptz;

## Average timestamp duration/interval

    WITH your_cte AS (
     ( SELECT '1970-01-01 23:59:42.123Z'::timestamptz AS started_at,
              '1970-01-01 23:59:43.321Z'::timestamptz AS finished_at
     ) UNION ALL (
       SELECT '1970-01-01 23:59:44.111Z'::timestamptz AS started_at,
              '1970-01-01 23:59:59.222Z'::timestamptz AS finished_at )

    ) SELECT avg(finished_at - started_at) AS aggregate FROM your_cte;

    -- avg
    -- ---------------
    --  00:00:08.1545
    -- (1 row)

<sup>[aggregate][] [aggregate ru][]</sup>

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
`UPDATE "your_tbl" SET "your_col" = 5;`

## Key words

Key words should be escaped (for example if used as table name or column name)
<http://www.postgresql.org/docs/current/static/sql-keywords-appendix.html#KEYWORDS-TABLE>

## Concatenation

<http://www.postgresql.org/docs/9.1/static/functions-string.html#FUNCTIONS-STRING-SQL>

    SELECT 'foo' || 'bar'

<http://www.postgresql.org/docs/9.1/static/functions-string.html#FUNCTIONS-STRING-OTHER>

    SELECT concat('foo', 'bar', 'xyz')

## Password file

Save password in `~/.pgpass` file and connect without password prompt:

* <http://www.postgresql.org/docs/current/static/libpq-pgpass.html>
* <https://wiki.postgresql.org/wiki/Pgpass>
* <http://dba.stackexchange.com/questions/14740/how-to-use-psql-with-no-password-prompt#14741>

## Current number of connections

Getting the current number of connections in a PostgreSQL

<http://stackoverflow.com/questions/5267715/getting-the-current-number-of-connections-in-a-postgresql-db#5270806>

    SELECT sum(numbackends) FROM pg_stat_database;

## Profiling/timing

Get/measure query execution timing/duration

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

## Vacuum full

    VACUUM FULL your_tbl;

<https://wiki.postgresql.org/wiki/Tuning_Your_PostgreSQL_Server#autovacuum>

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

    SELECT * FROM pg_stat_activity WHERE datname = 'your-db';

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

## Index

The [maximum index identifier][]/name length is 63 bytes
limited by the [NAMEDATALEN][] constant.

[maximum index identifier]: https://postgresql.org/docs/current/sql-syntax-lexical.html#SQL-SYNTAX-IDENTIFIERS
[namedatalen]: https://github.com/postgres/postgres/blob/REL_15_3/src/include/pg_config_manual.h#L29

## List indexes

    \di
    \d your_tbl

## List indexes size

    \di+

## Show/describe index

    SELECT * FROM "pg_indexes" WHERE "tablename" = 'your_tbl';

## Show/describe index size

    \di+ your_idx
    SELECT pg_table_size('your_idx'); -- bytes

## btree index

btree index is a multidirectional balanced tree
(многонаправленое сбалансированое дерево
<https://postgrespro.ru/docs/postgresql/12/btree-intro>).

## GIN index

GIN is a generalized inverted index (обобщённый инвертированный индекс
<https://postgrespro.ru/docs/postgrespro/10/gin-intro>).

## Create index

    CREATE INDEX your_idx ON your_tbl (your_col);

This equivalent to (B-tree is default):

    CREATE INDEX your_idx ON your_tbl USING btree (your_col);

## Create unique index

    CREATE UNIQUE INDEX your_idx ON your_tbl (your_col);

## Create compound index

    CREATE INDEX your_idx ON your_tbl (your_col1, your_col2);

## Create partial index

    CREATE INDEX your_idx ON your_tbl (your_col1) WHERE (your_col2 IS NULL);

## Create index on function expression

<https://postgresql.org/docs/current/functions-bitstring.html>

    CREATE INDEX your_bit_0_1_idx ON your_tbl (id)
    WHERE your_col IS NULL
       OR get_bit(your_col::bit(64), 63) = 0
       OR get_bit(your_col::bit(64), 62) = 0;

    SELECT id
    FROM your_tbl
    WHERE your_col IS NULL
       OR get_bit(your_col::bit(64), 63) = 0
       OR get_bit(your_col::bit(64), 62) = 0
    LIMIT 12345;

## Create index on jsonb

    CREATE INDEX your_idx ON your_tbl (
           (your_col1->>'your_prop1'),
           (your_col2->>'your_prop2')
    );

## Create index with include

    CREATE INDEX your_idx ON your_tbl
    USING btree (your_col1, your_col2)
    INCLUDE (your_col3, your_col4);

## Drop/delete/remove index

    DROP INDEX your_idx;

## Rename index

    ALTER INDEX IF EXISTS your_idx RENAME TO your_idx_new_nm;

## Alter index

    DROP INDEX your_idx;
    CREATE INDEX your_idx ON your_tbl (your_col);

## Show/read index comment

    \di+ your_idx

## Add comment to index

    COMMENT ON INDEX your_idx IS 'Your idx comment.';

## Remove comment from index

    COMMENT ON INDEX your_idx IS NULL;

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
    PGDATABASE=your-db \
    PGPORT=5433 \
    PGUSER=your-usr \
    PGPASSWORD=your-pwd \
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

    CREATE DATABASE your_db
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

## Get/read sequence

    SELECT nextval('your_seq');

## Set sequence

    SELECT setval('your_seq', 1234567890, true);

## Create sequence

    CREATE SEQUENCE your_seq INCREMENT 42 START 100500;

## Reset sequence

    ALTER SEQUENCE your_seq RESTART WITH 1;

## Read sequence without incrementing

    SELECT last_value FROM your_seq;

## Tables list

    \dt [PATTERN] (add "+" for more detail)

## List tables by the SQL

    SELECT * from information_schema.tables
    WHERE table_name LIKE '%your_tbl%'
          AND table_schema = current_schema();

## Create table

    CREATE TABLE your_tbl (id BIGSERIAL PRIMARY KEY, name text, age integer);

## Show/describe table

    \d your_tbl

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
      ADD COLUMN your_col2 timestamptz;

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

    ALTER TABLE your_tbl ADD CONSTRAINT your_cstr UNIQUE (your_col1, your_col2);

## Delete constraint

Remove constraint by name

    ALTER TABLE your_tbl DROP CONSTRAINT your_cstr;

## Rename constraint

    ALTER TABLE your_tbl
          RENAME CONSTRAINT your_cstr_old TO your_cstr_new;

## Create temporary table

    CREATE TEMP TABLE your_tbl
    (your_id BIGSERIAL, name varchar(10), bio TEXT, age INTEGER);

## Insert

    INSERT INTO your_tbl (nm, age) VALUES ('John', 3);
    COPY your_tbl FROM STDIN WITH DELIMITER AS ',';

## Insert from select

    INSERT INTO your_tbl (id, nm, age)
    SELECT 2, name, age FROM your_tbl WHERE id = 1;

## Insert and returning or select<sup>[1][insert and returning or select]</sup>

    WITH cte AS (
      INSERT INTO your_tbl (
        id, name
      ) VALUES (
        111, 'foo'
      ), (
        222, 'bar'
      ) ON CONFLICT (id)
        DO NOTHING
        RETURNING id, name
    ) (SELECT id, name, true AS ok
       FROM cte)
      UNION ALL
      (SELECT id, name, false AS ok
       FROM your_tbl
       WHERE id IN (111, 222)
         AND id NOT IN (SELECT id FROM cte));

[insert and returning or select]: https://stackoverflow.com/questions/49597668/postgres-9-5-on-conflict-do-select

## Upsert and returning or select<sup>[1][insert and returning or select]</sup>

    WITH cte AS (
      INSERT INTO your_tbl (
        id, name, revision
      ) VALUES (
        111, 'foo', 123
      ), (
        222, 'bar', 321
      ) ON CONFLICT (id)
        DO UPDATE SET revision = EXCLUDED.revision
           WHERE your_tbl.revision < EXCLUDED.revision
           RETURNING id, name, revision
    ) (SELECT id, name, revision, true AS ok
       FROM cte)
      UNION ALL
      (SELECT id, name, revision, false AS ok
       FROM your_tbl
       WHERE id IN (111, 222)
         AND id NOT IN (SELECT id FROM cte));

## Upsert/update/increment counter

    INSERT INTO your_tbl (id, count)
    VALUES (nextval('your_tbl_id_seq'::regclass), 1)
    ON CONFLICT (id)
    DO UPDATE SET count = COALESCE(your_tbl.count, EXCLUDED.count) + 1;

## Insert/update new line character

    INSERT INTO your_tbl (your_col) VALUES (E'First Line.\nSecond line.');
    UPDATE your_tbl SET your_col = E'First Line.\nSecond line.';

## Update data

<http://www.postgresql.org/docs/current/static/sql-update.html>

    UPDATE your_tbl SET foo = 'bar' || id;

## Swap/update two column's values

    UPDATE your_tbl
    SET your_col1 = your_col2,
        your_col2 = your_col1
    WHERE your_col3 IS NOT NULL;

## Update multiple rows concurrently without deadlock

<https://stackoverflow.com/questions/44660368/postgres-update-with-order-by-how-to-do-it#44669989>

    UPDATE your_tbl
    SET your_col1 = 42
    WHERE id IN (
          SELECT id
          FROM your_tbl
          WHERE id IN (1,2,3)
          ORDER BY id
          FOR UPDATE
    ) AS sub_t;

## Update multiple rows from subquery data

<https://stackoverflow.com/questions/18797608/update-multiple-rows-in-same-query-using-postgresql#18799497>

    UPDATE your_tbl AS upd_t
    SET your_col1 = sub_t.your_col1,
        your_col2 = sub_t.your_col2
    FROM (SELECT your_col1, your_col2 FROM your_tbl WHERE id = 123) AS sub_t
    WHERE upd_t.id = 321;

## Update multiple rows from subquery condition

    UPDATE your_tbl AS upd_t
    SET your_col = 42
    FROM (SELECT id FROM your_tbl WHERE id = 123) AS sub_t
    WHERE upd_t.id = sub_t.id;

## Update multiple rows from subquery join

    UPDATE your_tbl AS upd_t
       SET your_col = sub_t.your_col,
           your_col2 = joi_t.your_col
    FROM your_tbl2 AS sub_t
    JOIN your_tbl3 AS joi_t
      ON joi_t.ref_id = upd_t.id
    WHERE upd_t.id = sub_t.id;

## Update multiple rows via subquery

    UPDATE your_tbl1 t1
    SET (your_col1, your_col2) = (
         SELECT your_col1, your_col2 FROM your_tbl2 t2 WHERE t2.id = t1.id
    ) WHERE t1.id IN (1,2,3);

## Update null columns in multiple rows with CTE

    WITH your_cte AS (
         SELECT t2.your_col1, t2.your_col2
         FROM your_tbl1 AS t1
         JOIN your_tbl2 AS t2
              ON t2.your_id = t1.your_id
         WHERE t1.your_col1 IS NULL
           AND t2.your_col1 IS NOT NULL
         LIMIT 42
    ) UPDATE your_tbl1 AS t1
      SET name=cte.your_col1, age=cte.your_col2 FROM your_cte
      WHERE t1.your_col1 IS NULL;

## Update JSON timestamptz by timestamptz

    UPDATE your_tbl
    SET your_col = jsonb_set(
        your_col,
        '{YourProp1}',
        to_jsonb(
            to_char(
                ((your_col ->> 'YourProp2')::timestamptz - INTERVAL '3 hours'),
                'YYYY-MM-DD"T"HH24:MI:SSZ'
            )
        )
    ) WHERE (your_col ->> 'YourProp1') IS NULL;

## Update via subquery or with CTE

<https://postgrespro.ru/docs/postgresql/9.6/sql-update>

```sql
CREATE TABLE users1 (id BIGSERIAL primary key, name varchar(10), age integer);
CREATE TABLE users2 (id BIGSERIAL primary key, age integer);

INSERT INTO users1 (id) VALUES (1), (2), (3);
INSERT INTO users2 (id,name,age) VALUES (1,'foo',11), (2,'bar',22), (3,'xyz',33);
UPDATE users1 u1
SET (name,age) = (SELECT name,age FROM users2 u2 WHERE u2.id = u1.id)
WHERE u1.id IN (1,2);

WITH cte AS (
     SELECT u2.name, u2.age
     FROM users1 AS u1
     JOIN users2 AS u2
       ON u2.id = u1.id
     WHERE u1.name IS NULL
       AND u2.name IS NOT NULL
     LIMIT 42
) UPDATE users1 AS u1
  SET name=cte.name, age=cte.age
  FROM cte
  WHERE u1.name IS NULL;
```

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
         (SELECT your_col AS your_als
                FROM your_tbl
                WHERE your_col = 42
         ) UNION ALL (
          SELECT your_col2 AS your_als
                 FROM your_tbl
                 WHERE your_col = 42
         ) UNION ALL (
          SELECT your_col3 AS your_als
                 FROM your_tbl
                 WHERE your_col = 42)
    ) RETURNING your_col;

## Truncate all data

<http://www.postgresql.org/docs/current/static/sql-truncate.html>

    BEGIN; TRUNCATE your_tbl, your_tbl2 CASCADE; ALTER SEQUENCE your_seq RESTART WITH 1; COMMIT;

## Select/fetch query

    SELECT * FROM your_tbl;

## Sort order with nulls at beginning/end

    SELECT * FROM your_tbl ORDER BY your_col NULLS FIRST;
    SELECT * FROM your_tbl ORDER BY your_col NULLS LAST;

## Check row exists

    SELECT EXISTS(SELECT 1 FROM your_tbl where id = 42);

## Fetch with reference a CTE in subsequent CTE

<https://stackoverflow.com/questions/27204824/sql-use-a-reference-of-a-cte-to-another-cte#27205768>

    WITH your_cte1 AS (SELECT * FROM your_tbl),
         your_cte2 AS (SELECT * FROM your_cte1)
    SELECT * FROM your_cte2;

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

## Intersection (overlapping)

    SELECT tstzrange('1970-12-31', '2000-12-31', '[]')
        && tstzrange('1970-12-31', '2000-12-31', '[]');

## Join/соединение

* <https://postgrespro.ru/docs/postgrespro/current/tutorial-join>
* <https://en.wikipedia.org/wiki/Join_(SQL)>

## Join types: outer (left/right/full) and inner and cross

1. `INNER JOIN` = `JOIN`
2. `LEFT OUTER JOIN`  = `LEFT JOIN`
   `RIGHT OUTER JOIN` = `RIGHT JOIN`
   `FULL OUTER JOIN`  = `FULL JOIN`
3. `CROSS JOIN`

* <https://postgresql.org/docs/current/queries-table-expressions.html#id-1.5.6.6.5.6.4.3.1.1>
* <https://postgrespro.ru/docs/postgrespro/15/queries-table-expressions#id-1.5.6.6.5.6.4.3.1.1>
* <https://stackoverflow.com/questions/406294/left-join-vs-left-outer-join-in-sql-server#42854352>

## Outer join shorthand as left join and right join

* `LEFT JOIN`  = `LEFT OUTER JOIN`
* `RIGHT JOIN` = `RIGHT OUTER JOIN`

https://www.postgresql.org/docs/current/queries-table-expressions.html#id-1.5.6.6.5.6.4.3.1.1

## Join behavior/description

* `INNER JOIN`
   Returns rows when there is a match in both tables.
* `LEFT JOIN`
   Returns all rows from the left table, even if there
   are no matches in the right table.
* `RIGHT JOIN`
   Returns all rows from the right table, even if there
   are no matches in the left table.
* `FULL JOIN`
   Combines the results of both left and right outer joins.
   The joined table will contain all records from both the tables
   and fill in NULLs for missing matches on either side.
* `SELF JOIN`
   Joins a table to itself as if the table were two tables,
   temporarily renaming at least one table in the SQL statement.
* `CROSS JOIN` or `CARTESIAN JOIN`
   Returns the Cartesian product of the sets of records
   from the two or more joined tables.

<https://stackoverflow.com/questions/5706437/whats-the-difference-between-inner-join-left-join-right-join-and-full-join#28719292>

## Inner join is default

<https://www.postgresql.org/docs/current/queries-table-expressions.html#id-1.5.6.6.5.6.4.3.1.1>

    SELECT * FROM your_tbl1 JOIN AS t1 JOIN your_tbl2 AS t2 ON t1.id = t2.rel_id;
    SELECT * FROM your_tbl1 INNER JOIN AS t1 JOIN your_tbl2 AS t2 ON t1.id = t2.rel_col;

## Join conditional/case/polymorphic association

<https://stackoverflow.com/questions/2333501/sql-conditional-case-joining-polymorphic-associations#2333543>

    SELECT cli.id AS client_id,
           CASE WHEN per.id IS NOT NULL THEN 'person'
                WHEN cop.id IS NOT NULL THEN 'company'
           END AS person_type,
           COALESCE(per.id, cop.id) AS person_id,
           COALESCE(per.first_name, cop.first_name) AS first_name
    FROM clients AS cli
    LEFT JOIN people AS per ON per.client_id = cli.id
    LEFT JOIN companies AS com ON com.client_id = cli.id
    LEFT JOIN people AS cop ON cop.id = com.person_id
    WHERE cli.id = 42;

## Combining queries/сочетание запросов union/intersect/except

https://postgrespro.ru/docs/postgresql/current/queries-union

## Union/объединение

* <https://en.wikipedia.org/wiki/Union_(SQL)>
* <https://postgrespro.ru/docs/postgrespro/current/tutorial-join>

```sql
WITH cte AS (
     SELECT id,
            your_tbl2_id,
            your_id2
     FROM your_tbl1
     WHERE id = 42
) ( SELECT 'your_tbl1' AS table_nm,
           id,
           your_col1,
           NULL AS your_col2,
           NULL AS your_col3
    FROM 'your_tbl1'
    WHERE id IN (SELECT id FROM cte)
  ) UNION ALL (
    SELECT 'your_tbl2' AS table_nm,
           id,
           NULL AS your_col1,
           your_col2,
           -1 AS your_col3
    FROM your_tbl2
    WHERE your_tbl1_id = IN (SELECT id FROM cte)
  ) UNION ALL (
    SELECT 'your_tbl3' AS table_nm,
           id,
           NULL AS your_col1,
           NULL AS your_col2
    FROM your_tbl3
    WHERE id IN (SELECT your_id2 FROM cte)
  ) ORDER BY your_col1 NULLS LAST;
```

## List functions

    \df
    \df your_schema.* -- List functions in schema `your_schema`.

## Show function/trigger by name

    \df+ your_nm

## List all trigger functions

    SELECT * FROM information_schema.triggers;

## List trigger functions of table

    SELECT event_object_table,
           trigger_name,
           event_manipulation,
           action_statement,
           action_timing
    FROM information_schema.triggers
    WHERE event_object_table = 'your_tbl'
    ORDER BY event_object_table,
             event_manipulation;

## Remove function

    DROP FUNCTION your_fn;

## Create or replace function

    CREATE OR REPLACE FUNCTION your_fn(
      IN key text
    ) RETURNS TABLE (value bigint) AS
    $BODY$
      INSERT INTO serialkeys (key, value) VALUES (key, 1)
      ON CONFLICT (key)
      DO UPDATE SET value = serialkeys.value + 1,
                    updated_at = now()
      RETURNING value;
    $BODY$
      LANGUAGE sql;

## Create or replace/update trigger function

    CREATE OR REPLACE FUNCTION your_trig() RETURNS trigger AS $$
      BEGIN
        IF NEW.your_col1 <> OLD.your_col1 OR
           NEW.your_col2 <> OLD.your_col2
        THEN
          NEW.your_col3 := 'your new value';
        END IF;
        RETURN NEW;
      END

## Create or replace trigger

    CREATE TRIGGER your_trig_on_your_tbl BEFORE INSERT OR UPDATE
        ON your_tbl FOR EACH ROW EXECUTE PROCEDURE your_trig();

## Drop trigger

    DROP TRIGGER IF EXISTS your_trig ON your_tbl;

## psql: repeat/re-execute query every 5 seconds within loop

    select 42;
    \watch 5

## psql: write output to stdout

    \o

## psql: write output to file

    \o path/to/your_file

## CSV Export by SQL to STDOUT

    COPY (SELECT your_col1, your_col2 FROM your_tbl) TO STDOUT
    WITH (FORMAT csv, DELIMITER ';', NULL '\N', QUOTE '"', ESCAPE '\');

## CSV Export by SQL to file

    COPY (SELECT your_col1, your_col2 FROM your_tbl) TO 'path/to/file.csv'
    WITH (FORMAT csv, DELIMITER ';', NULL '\N', QUOTE '"', ESCAPE '\');

## CSV Export by psql command by SQL to file

    psql --command="COPY (SELECT your_col1, your_col2 FROM your_tbl) TO STDOUT
                    WITH (FORMAT csv, DELIMITER ';', NULL '\N', QUOTE '"'"'"', ESCAPE '\');

## CSV Export by SQL to STDOUT as insert values

    COPY (
      SELECT 'WITH i1 AS (INSERT INTO your_tbl1 VALUES (', t1.*, ') RETURNING 1',
             '),     i2 AS (INSERT INTO your_tbl2 VALUES (', t2.*, ') RETURNING 1',
             ') SELECT (SELECT count(*) FROM i1) AS your_tbl1,
             (SELECT count(*) FROM i2) AS your_tbl2;'
      FROM your_tbl1 AS t1
      LEFT JOIN your_tbl2 AS t2 ON t2.id = t1.tbl1_id
      WHERE t1.id = 42
    ) TO STDOUT WITH (
      FORMAT csv,
      DELIMITER ',',
      NULL 'NULL',
      QUOTE '''',
      ESCAPE '\',
      FORCE_QUOTE *
    );

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

## Prepared statement create

<http://www.postgresql.org/docs/current/static/sql-prepare.html>

    PREPARE your_statement_nm (text, int) AS
    SELECT * FROM your_tbl
    WHERE "name" = $1 AND "age" = $2;

## Prepared statement execute

    EXECUTE your_statement_nm ('foo', 123);

## Prepared statement delete

<http://www.postgresql.org/docs/current/static/sql-deallocate.html>

    DEALLOCATE your_statement_nm;

<!-- Reference -->

[aggregate]: https://postgresql.org/docs/current/functions-aggregate.html
[aggregate ru]: https://postgrespro.ru/docs/postgrespro/15/functions-aggregate
