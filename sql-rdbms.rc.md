# SQL RDBMS rc

## Explain

<http://www.postgresql.org/docs/current/static/sql-explain.html>  
<https://wiki.postgresql.org/wiki/Using_EXPLAIN>

    EXPLAIN SELECT * FROM your_tbl;

## Explain analyze

    BEGIN;
    EXPLAIN ANALYZE UPDATE your_tbl SET foo = 'bar' || id;
    ROLLBACK;
