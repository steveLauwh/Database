## Big Countries「LeetCode 595」

题目：找出大于300万平方公里的面积或者人口超过2500万的记录

```
There is a table World

+-----------------+------------+------------+--------------+---------------+
| name            | continent  | area       | population   | gdp           |
+-----------------+------------+------------+--------------+---------------+
| Afghanistan     | Asia       | 652230     | 25500100     | 20343000      |
| Albania         | Europe     | 28748      | 2831741      | 12960000      |
| Algeria         | Africa     | 2381741    | 37100000     | 188681000     |
| Andorra         | Europe     | 468        | 78115        | 3712000       |
| Angola          | Africa     | 1246700    | 20609294     | 100990000     |
+-----------------+------------+------------+--------------+---------------+
A country is big if it has an area of bigger than 3 million square km or a population of more than 25 million.

Write a SQL solution to output big countries' name, population and area.

For example, according to the above table, we should output:

+--------------+-------------+--------------+
| name         | population  | area         |
+--------------+-------------+--------------+
| Afghanistan  | 25500100    | 652230       |
| Algeria      | 37100000    | 2381741      |
+--------------+-------------+--------------+
```

创建表：

```sql
CREATE TABLE World 
(name char(50) NOT NULL, 
continent char(50) NOT NULL, 
area BIGINT NOT NULL, 
population BIGINT NOT NULL, 
gdp BIGINT NOT NULL, 
PRIMARY KEY(name) 
) ENGINE=InnoDB;
```

插入多条记录：

```sql
INSERT INTO 
[表名]([列名],[列名]) 
 VALUES
([列值],[列值])),
([列值],[列值])),
([列值],[列值]));
```
在程序中，插入批量数据时，最好使用这种通过一条 INSERT 语句来一次性插入的方式。这样可以避免程序和数据库建立多次连接，从而增加服务器负荷。

如：

```sql
INSERT INTO World 
(name, continent, area, population, gdp)
VALUES ('Albania', 'Albania', 28748, 2831741, 12960000);
```
