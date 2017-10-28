## Rising Temperature「LeetCode 197」

题目：给一个 Weather 表，找出比前一天温度高的 Id

```
Given a Weather table, write a SQL query to find all dates' Ids 
with higher temperature compared to its previous (yesterday's) dates.

+---------+------------+------------------+
| Id(INT) | Date(DATE) | Temperature(INT) |
+---------+------------+------------------+
|       1 | 2015-01-01 |               10 |
|       2 | 2015-01-02 |               25 |
|       3 | 2015-01-03 |               20 |
|       4 | 2015-01-04 |               30 |
+---------+------------+------------------+
For example, return the following Ids for the above Weather table:
+----+
| Id |
+----+
|  2 |
|  4 |
+----+
```

DATEDIFF() 函数返回两个日期之间的天数。`DATEDIFF(date1,date2)`

TO_DAYS() 函数用来将日期换算成天数

SUBDATE() 函数用来将日期减1
