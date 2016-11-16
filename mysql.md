# MySQL

    mysql -h 192.168.1.2 -u danil [-p] -t danil_test \
     < ~/src/common.sql > ~/data
    mysql -h localhost -u root [-p] \
     -e "SELECT * FROM test_db.test_table;"
    mysqlshow -h localhost -u root -p
    mysqladmin -h localhost -u root -p version
    mysql -u root -B -N \
     -e "SELECT DISTINCT
          CONCAT('SHOW GRANTS FOR ''',user,'''@''',host,''';')
          AS query FROM user" mysql | mysql -u root
    mysqlcheck -A

    CHECK TABLE ... EXTENDED;

## Dump

    mysqldump --result-file=~/backup.sql your_db_name

`--default-character-set=latin1` option mean what MySQL server runing
with latin1 character set.  But data stored in database may be utf8.

```sh
export foo=your_db_name && \
  mysqldump -h127.0.0.1 -Pyour_port -uyour_user \
            --default-character-set=latin1 -r \
            --no-create-info --complete-insert \
            $foo your_tbl_name1, your_tbl_name2 | \
  xz --compress > $foo\_$(date --utc +%Y%m%dT%H%M%SZ).sql.xz
```

### Restore

    mysql < path/to/dump.sql.xz

## Show system variables

    SHOW VARIABLES LIKE '%character%';
    SELECT @@global.time_zone, @@session.time_zone;

### Engine type (MyISAM or InnoDB)

    SHOW GLOBAL VARIABLES LIKE 'storage_engine';

## Create user

    GRANT CREATE, INSERT, DELETE, UPDATE, SELECT, DROP, INDEX, ALTER, LOCK TABLES
     ON danil.* TO 'danil'@'localhost' IDENTIFIED BY 'password';

Privileges: ALL, CREATE, DELETE, GRANT OPTION, INSERT, SELECT, SHOW
DATABASES, UPDATE, USAGE, LOCK TABLES and so on
(<http://dev.mysql.com/doc/refman/5.1/en/grant.html>).

## Set password

    SET PASSWORD FOR 'danil'@'localhost' = PASSWORD('password');
    mysqladmin -u root -h localhost password 'new-password'

## Show grants

    SHOW GRANTS;
    SHOW GRANTS FOR 'danil'@'localhost';
    SELECT Host, User FROM mysql.user WHERE User = 'danil';

## Revoke grants

    REVOKE ALL ON danil.* FROM 'danil'@'localhost';

## Remove user

    DELETE FROM mysql.user WHERE User = 'danil';

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

### Create database

    CREATE DATABASE IF NOT EXISTS your_database CHARACTER SET utf8;

### Alter database

    ALTER DATABASE 'your_database' DEFAULT CHARACTER SET utf8
     COLLATE utf8_general_ci;

### Drop database

    DROP DATABASE IF EXISTS your_database;

## Query

Retrieve rows 6-15.

    SELECT Host, User, Password FROM mysql.user LIMIT 5,10;

### Query from file

    source sqlfile;

## List tables

    SHOW TABLES;
    SHOW FULL TABLES FROM danil LIKE 'test%';
    +-------------------------+------------+
    | Tables_in_danil (test%) | Table_type |
    +-------------------------+------------+
    | test_table              | BASE TABLE |
    +-------------------------+------------+
    1 row in set (0.00 sec)

## Describe table

    DESCRIBE test_table;
    SELECT * FROM INFORMATION_SCHEMA.TABLES
    WHERE table_schema = 'danil'
          AND table_name LIKE 'test_table';

## Create table

    CREATE TABLE IF NOT EXISTS danil.test_table
      (
        id INT(11) NOT NULL AUTO_INCREMENT,
        text CHAR(255) NOT NULL,
        PRIMARY KEY (id)
      );
    CREATE TABLE IF NOT EXISTS danil.test_table_2
     LIKE danil.test_table;

## Drop table

    DROP TABLE IF EXISTS danil.test_table [, danil.test_table_2];

### Drop all tables

Generated set of drop statements
<http://stackoverflow.com/questions/3476765/mysql-drop-all-tables-ignoring-foreign-keys#8248281>

    SELECT concat('DROP TABLE IF EXISTS ', table_name, ';')
      FROM information_schema.tables
      WHERE table_schema = 'MyDatabaseName';

## Show table status

Get engine type (MyISAM or InnoDB)

    SHOW TABLE STATUS FROM danil LIKE 'test%';

## Describe columns

    DESCRIBE danil.test_table '%';
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

    ALTER TABLE users ADD COLUMN login varchar(255);

### Delete column

    ALTER TABLE cashouts DROP COLUMN hold_operation_id;

### Rename column

    ALTER TABLE users CHANGE COLUMN old_name new_name varchar(255);

## Index

Indeces

### Create

    ALTER TABLE `your_table`
    ADD UNIQUE `your_index`(`first_column`, `second_column`);

### Show

Describe index

    SHOW INDEX FROM your_table;

### Remove

    ALTER TABLE your_table DROP INDEX your_index;
    DROP index your_index_name ON your_tbl_name;

## Explain

    EXPLAIN SELECT * FROM your_table WHERE id = 1;

## Truncate

Empties a table completely.

    TRUNCATE TABLE accounting_spro_spro1s;

## Insert

    INSERT INTO danil.test_table (id, text) VALUES (1, 'test text');
    INSERT INTO tbl_temp2 (fld_id)
        SELECT tbl_temp1.fld_order_id
        FROM tbl_temp1 WHERE tbl_temp1.fld_order_id > 100;
    LOAD DATA LOCAL INFILE '~/path/to/filename' INTO TABLE table;

## Delete row

    DELETE FROM mysql.user WHERE User = 'danil';

## Update columns

    UPDATE mobotix.menus SET article_text='' WHERE id='63';
    Query OK, 1 row affected (0.01 sec)

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

### CSV

    SELECT * FROM users INTO OUTFILE '/path/to/file.csv'
    FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';
