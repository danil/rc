# MySQL

    mysql --host=192.168.1.2 --user=your_user [--passowrd] --table=your_table_name \
     < path/to/dump.sql > path/to/output.sql
    mysql -h localhost -u root [-p] \
     -e "SELECT * FROM test_db.test_table;"
    mysqlshow -h localhost -u root -p
    mysqladmin -h localhost -u root -p version
    mysql --user=root --password --batch --skip-column-names \
     --execute="SELECT DISTINCT
          CONCAT('SHOW GRANTS FOR ''',user,'''@''',host,''';')
          AS query FROM user" mysql | mysql -u root
    mysqlcheck -A

    CHECK TABLE ... EXTENDED;

## Version

Get/check/lookup mysql versoin

### Shell

    mysql --version

### SQL

```sql
SELECT VERSION();
SHOW VARIABLES LIKE "%version%";
```

### InnoDB version

Get/check/lookup InnoDB versoin

```sql
SELECT PLUGIN_NAME, PLUGIN_VERSION, PLUGIN_TYPE_VERSION, PLUGIN_LIBRARY,
       PLUGIN_LIBRARY_VERSION, PLUGIN_AUTHOR
FROM information_schema.PLUGINS
WHERE PLUGIN_NAME = 'innodb';
```

## Dump

### Create

    mysqldump --result-file=~/backup.sql your_db_name

`--default-character-set=latin1` option mean what MySQL server runing
with latin1 character set.  But data stored in database may be utf8.

```sh
export foo=your_db_name && \
  mysqldump -h127.0.0.1 -Pyour_port -uyour_user \
            --default-character-set=latin1 -r \
            --no-create-info --complete-insert \
            $foo your_table_name1, your_table_name2 | \
  xz --compress > $foo\_$(date --utc +%Y%m%dT%H%M%SZ).sql.xz
```

#### Only schema

Dump schema without data

    mysqldump --no-data your_db_name > dump.sql

#### Without drop tables

    mysqldump --skip-add-drop-table your_db_name > dump.sql

### Restore

    mysql < path/to/dump.sql
    cat path/to/dump.sql.xz | xz --decompress | mysql --user=your_user --password your_db_name

## Show system variables

    SHOW VARIABLES LIKE '%character%';

### Time zone

    SELECT @@global.time_zone, @@global.time_zone, @@session.time_zone;

### Engine type (MyISAM or InnoDB)

    SHOW GLOBAL VARIABLES LIKE 'storage_engine';

## Users

### List

    select * from mysql.user;

### Create

    GRANT CREATE, INSERT, DELETE, UPDATE, SELECT, DROP, INDEX, ALTER, LOCK TABLES
      ON `your_db_name`.* TO 'your_user'@'%' IDENTIFIED BY 'password';
    GRANT ALL ON `your_db_name`.* TO 'your_user'@'localhost';
    GRANT ALL ON *.* TO 'your_user'@'localhost';

Privileges: ALL, CREATE, DELETE, GRANT OPTION, INSERT, SELECT, SHOW
DATABASES, UPDATE, USAGE, LOCK TABLES and so on
(<http://dev.mysql.com/doc/refman/5.1/en/grant.html>).

### Set password

    SET PASSWORD FOR 'your_user'@'localhost' = PASSWORD('password');
    mysqladmin -u root -h localhost password 'new-password'

### Show grants

    SHOW GRANTS;
    SHOW GRANTS FOR 'your_user'@'localhost';
    SHOW GRANTS FOR 'your_user'@'%';
    SELECT Host, User FROM mysql.user WHERE User = 'your_user';

### Revoke grants

    REVOKE ALL ON your_user.* FROM 'your_user'@'localhost';

### Remove user

    DELETE FROM mysql.user WHERE User = 'your_user';

## Show character sets

    SHOW CHARACTER SET LIKE 'utf%';
    +---------+---------------+-------------------+--------+
    | Charset | Description   | Default collation | Maxlen |
    +---------+---------------+-------------------+--------+
    | utf8    | UTF-8 Unicode | utf8_general_ci   |      3 |
    +---------+---------------+-------------------+--------+
    1 row in set (0.00 sec)

## Databases

### Switching to database

    USE your_database;

### Show databases

    SHOW DATABASES LIKE '%your_database%';
    +--------------------+
    | Database           |
    +--------------------+
    | information_schema |
    | mysql              |
    | your_database      |
    +--------------------+
    3 rows in set (0.00 sec)

### Describe database

    SELECT * FROM INFORMATION_SCHEMA.SCHEMATA
     WHERE SCHEMA_NAME LIKE 'your_database';
    +--------------+---------------+----------------------------+
    | CATALOG_NAME |  SCHEMA_NAME  | DEFAULT_CHARACTER_SET_NAME |
    +--------------+---------------+----------------------------+
    | NULL         | your_database | utf8                       |
    +--------------+---------------+----------------------------+
    1 row in set (0.00 sec)

### Database charset

Describe databases character set and collation

    SELECT SCHEMA_NAME 'database',
           DEFAULT_CHARACTER_SET_NAME 'charset',
           DEFAULT_COLLATION_NAME 'collation'
      FROM information_schema.SCHEMATA;

### Create database

    CREATE DATABASE IF NOT EXISTS your_database
      CHARACTER SET utf8 COLLATE utf8_general_ci;

### Alter database

    ALTER DATABASE `your_database` DEFAULT CHARACTER SET utf8
     COLLATE utf8_general_ci;

### Drop database

    DROP DATABASE IF EXISTS your_database;

## Query

Retrieve rows 6-15.

    SELECT Host, User, Password FROM mysql.user LIMIT 5,10;

### Group by with count

    SELECT your_col1, count(*) FROM your_table_name
    GROUP BY your_col2 HAVING count(*) > 1;

### Query from file

    source sqlfile;

### Copy table

To copy with indexes and triggers
<http://stackoverflow.com/questions/3280006/duplicating-a-mysql-table-indexes-and-data#3280042>

    CREATE TABLE new_table_name LIKE old_table_name; 
    INSERT new_table_name SELECT * FROM old_table_name;

### Copy rows in same table

```SQL
INSERT INTO your_table_name (name, age)
  SELECT 'John', age FROM your_table_name WHERE name = 'Alice';
```

## List tables

    SHOW TABLES;
    SHOW FULL TABLES FROM your_user LIKE 'test%';
    +-------------------------+------------+
    | Tables_in_your_user (test%) | Table_type |
    +-------------------------+------------+
    | test_table              | BASE TABLE |
    +-------------------------+------------+
    1 row in set (0.00 sec)

## Rename table

    ALTER TABLE old_table_name RENAME new_table_name;
    RENAME TABLE old_table_name TO new_table_name;

## Describe table

    DESCRIBE test_table;
    SELECT * FROM INFORMATION_SCHEMA.TABLES
    WHERE table_schema = 'your_user'
          AND table_name LIKE 'test_table';

### Table charset

Describe table  character set and collation

    SHOW TABLE STATUS WHERE NAME LIKE 'your_table_name';

## Create table

    CREATE TABLE IF NOT EXISTS your_user.test_table
      (
        id INT(11) unsigned NOT NULL AUTO_INCREMENT,
        tag_id INT(11) unsigned NOT NULL,
        email CHAR(255) NOT NULL,
        name CHAR(255) NOT NULL,
        age INT(11) NOT NULL,
        PRIMARY KEY (id)
        FOREIGN KEY (`tag_id`) REFERENCES tags(`id`),
        UNIQUE KEY(email)
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8 DEFAULT COLLATE utf8_unicode_ci;

### Create table by table

    CREATE TABLE IF NOT EXISTS your_user.test_table_2
     LIKE your_user.test_table;

## Drop table

    DROP TABLE IF EXISTS your_db_name.your_table_name1, your_db_name.your_table_name1;

### Drop all tables

Generated set of drop statements
<http://stackoverflow.com/questions/3476765/mysql-drop-all-tables-ignoring-foreign-keys#8248281>

    SELECT concat('DROP TABLE IF EXISTS ', table_name, ';')
      FROM information_schema.tables
      WHERE table_schema = 'MyDatabaseName';

## Show table status

Get engine type (MyISAM or InnoDB)

    SHOW TABLE STATUS FROM your_user LIKE 'test%';

## Describe columns

    DESCRIBE your_user.test_table '%';
    +------------+----------+------+-----+---------+----------------+
    | Field      | Type     | Null | Key | Default | Extra          |
    +------------+----------+------+-----+---------+----------------+
    | Id         | int(11)  | NO   | PRI | NULL    | auto_increment |
    | Name       | char(35) | NO   |     |         |                |
    | Country    | char(3)  | NO   | UNI |         |                |
    | District   | char(20) | YES  | MUL |         |                |
    | Population | int(11)  | NO   |     | 0       |                |
    +------------+----------+------+-----+---------+----------------+
    5 rows in set (0.00 sec)

## Alter table

### Add column

    ALTER TABLE your_table_name ADD COLUMN your_col2 INT(11) AFTER your_col1;

### Delete column

    ALTER TABLE `your_table_name` DROP `your_col1`, DROP `your_col2`;

### Rename column

    ALTER TABLE your_table_name CHANGE COLUMN old_name new_name varchar(255);

### Modify column

Modify column without rename

    ALTER TABLE your_table_name MODIFY COLUMN your_col VARCHAR(255) NOT NULL;

## Index

Indeces

### Show

Describe index

    SHOW INDEX FROM your_table;

### Create

    ALTER TABLE `your_table` ADD INDEX `your_index_name`(`your_col`);
    ALTER TABLE `your_table`
      ADD UNIQUE `your_index_name`(`your_col1`, `your_col2`);

### Create uniqe constraint

    ALTER TABLE `your_table` ADD CONSTRAINT 'your_constraint_name'
      UNIQUE (`your_col1`, `your_col2`);

### Remove

    ALTER TABLE `your_table` DROP INDEX 'your_index';
    DROP INDEX 'your_index_name' ON `your_table_name`;

## Explain

    EXPLAIN SELECT * FROM your_table WHERE id = 1;

## Truncate

Empties a table completely.

    TRUNCATE TABLE your_table;

## Insert

    INSERT INTO `your_db_name`.`your_table_name1` (id, text)
      VALUES (1, 'foo'), (2, 'bar');
    INSERT INTO table_temp2 (fld_id)
        SELECT table_temp1.fld_order_id
        FROM table_temp1 WHERE table_temp1.fld_order_id > 100;
    LOAD DATA LOCAL INFILE '~/path/to/filename' INTO TABLE table;

## Update if duplicate

    INSERT INTO your_table_name ("latitude", "longitude", "name")
        VALUES (1,2,'foobar')
        ON DUPLICATE KEY UPDATE "name" = 'foobar';

## Delete row

    DELETE FROM mysql.user WHERE User = 'foobar';

## Update columns

    UPDATE `your_db_name`.`your_table_name`
      SET your_col1='foo', your_col2='bar' WHERE id='1';
    Query OK, 1 row affected (0.01 sec)

### Update with join

Suitable with self referened/sourced update/set

    UPDATE your_table_name t1 join your_table_name t2
      ON t1.your_col1 = t2.your_col1
      SET t1.your_col2 = t2.your_col2
      WHERE t1.your_col3 = 'foo' AND t2.your_col3 = 'bar';

### Update with subquery

    UPDATE users
        SET portfolio_projects_count=(
            SELECT COUNT(id) FROM portfolio_projects WHERE user_id=users.id
            );

## Disable foreign key constraint check

    SET FOREIGN_KEY_CHECKS = 0;
    SOURCE dump_file_name;
    SET FOREIGN_KEY_CHECKS = 1;

## Quering

### Finding duplicate values

<http://stackoverflow.com/questions/688549/finding-duplicate-values-in-mysql#688551>

    SELECT email, COUNT(*) c FROM users GROUP BY email HAVING c > 1;
    SELECT user_id, offer_id, COUNT(*) c FROM offers_users GROUP BY user_id, offer_id HAVING c > 1;

### Timestamp to datetime

    SELECT *, from_unixtime(`created_at`) FROM `your_table_name`
        ORDER BY created_at DESC;

### CSV

    SELECT * FROM users INTO OUTFILE '/path/to/file.csv'
    FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

## Data types

### Enum

    ALTER TABLE your_table_name CHANGE your_col your_col ENUM('foo','bar');

## Binary log

### Purge

    mysql --user=root --password='your password' \
      --execute="PURGE BINARY LOGS BEFORE '1970-01-01 00:00:00';"
