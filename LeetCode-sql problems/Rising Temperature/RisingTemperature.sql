# Write your MySQL query statement below
# DATEDIFF
SELECT t1.Id FROM Weather t1, Weather t2 WHERE t1.Temperature > t2.Temperature AND DATEDIFF(t1.Date, t2.Date) = 1;

# TO_DAYS
SELECT t1.Id FROM Weather t1, Weather t2 WHERE t1.Temperature > t2.Temperature AND TO_DAYS(t1.Date) = TO_DAYS(t2.Date) + 1;

# SUBDATE
SELECT t1.Id FROM Weather t1, Weather t2 WHERE t1.Temperature > t2.Temperature AND SUBDATE(t1.Date, 1) = t2.Date;
