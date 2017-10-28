# Write your MySQL query statement below
# AS 重命名表名或列名

SELECT Name AS Customers FROM Customers WHERE Id NOT IN (SELECT CustomerId FROM Orders);
