# SQL RDBMS rc

## Sum/avg

    SELECT avg(asum) FROM (
        SELECT your_col1, sum(your_col2) AS asum
        FROM your_tbl
        GROUP BY your_col1
    ) AS inner_query;

## Explain

<http://www.postgresql.org/docs/current/static/sql-explain.html>  
<https://wiki.postgresql.org/wiki/Using_EXPLAIN>

    EXPLAIN SELECT * FROM your_tbl;

## Explain analyze

    BEGIN;
    EXPLAIN ANALYZE UPDATE your_tbl SET foo = 'bar' || id;
    ROLLBACK;
