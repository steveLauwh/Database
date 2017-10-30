## Duplicate Emails「LeetCode 182」

题目：找出重复的邮箱

```
Write a SQL query to find all duplicate emails in a table named Person.

+----+---------+
| Id | Email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+
For example, your query should return the following for the above table:

+---------+
| Email   |
+---------+
| a@b.com |
+---------+
Note: All emails are in lowercase.
```

在 SQL 中增加 HAVING 子句原因是，WHERE 关键字无法与合计函数一起使用。

GROUP BY ... Having COUNT(*)
