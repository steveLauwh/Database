## Employees Earning More Than Their Managers「LeetCode 181」

题目：员工比经理挣得多

```
The Employee table holds all employees including their managers. 
Every employee has an Id, and there is also a column for the manager Id.

+----+-------+--------+-----------+
| Id | Name  | Salary | ManagerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | NULL      |
| 4  | Max   | 90000  | NULL      |
+----+-------+--------+-----------+
Given the Employee table, write a SQL query that finds out employees who earn more than their managers. 
For the above table, Joe is the only employee who earns more than his manager.

+----------+
| Employee |
+----------+
| Joe      |
+----------+
```
Employee 表中包含员工信息和经理信息，找出员工的薪水高于经理的薪水；

经理也是员工

ManagerId 表示经理ID，Id 表示员工ID，比如ID = 1，Joe 的薪水是 70000，而他的经理 ManagerId = 3，表示经理是 Sam，他的薪水是 60000，所以 Joe
的薪水要高于他的经理薪水。

------

INNER JOIN 用于根据两个或多个表中的列之间的关系，从这些表中查询数据。

