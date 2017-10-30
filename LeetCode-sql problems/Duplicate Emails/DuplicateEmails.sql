# Write your MySQL query statement below
SELECT Email FROM Person GROUP BY EMail HAVING COUNT(*) > 1;
