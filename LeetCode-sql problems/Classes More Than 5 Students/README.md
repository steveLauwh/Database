## Classes More Than 5 Students「LeetCode 596」

题目：找出 class 列 大于等于 5

```
There is a table courses with columns: student and class

Please list out all classes which have more than or equal to 5 students.

For example, the table:

+---------+------------+
| student | class      |
+---------+------------+
| A       | Math       |
| B       | English    |
| C       | Math       |
| D       | Biology    |
| E       | Math       |
| F       | Computer   |
| G       | Math       |
| H       | Math       |
| I       | Math       |
+---------+------------+
Should output:

+---------+
| class   |
+---------+
| Math    |
+---------+
Note:
The students should not be counted duplicate in each course.
```

关键词 DISTINCT 用于返回唯一不同的值。 `SELECT DISTINCT 列名称 FROM 表名称`

GROUP BY 语句用于结合合计函数，根据一个或多个列对结果集进行分组。

COUNT() 函数返回匹配指定条件的行数。

`SELECT COUNT(DISTINCT column_name) FROM table_name` 返回指定列的不同值的数目
