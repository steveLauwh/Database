## Second Highest Salary「LeetCode 176」

题目：从 Employee 表中获取第二高薪水。

```
Write a SQL query to get the second highest salary from the Employee table.

+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
For example, given the above Employee table, the query should return 200 as the second highest salary. 
If there is no second highest salary, then the query should return null.

+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+
```

用 MySQL 实现。

先从表中，得到最大的薪水，再取出的不包含最大薪水值的最大薪水，就是第二高薪水。
