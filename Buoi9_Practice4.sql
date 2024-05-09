--ex1: datalemur-laptop-mobile-viewership.
SELECT 
SUM(CASE
  WHEN device_type = 'laptop' THEN 1
  ELSE 0
END) AS laptop_reviews,
SUM(CASE
  WHEN device_type IN ('tablet','phone') THEN 1
  ELSE 0
END) AS mobile_reviews
FROM viewership;
--ex2: datalemur-triangle-judgement.
SELECT *,
CASE
    WHEN x + y > z and x + z > y and y + z > x THEN 'Yes'
    ELSE 'No'
END AS triangle
FROM Triangle;
--ex3: datalemur-uncategorized-calls-percentage.
--ex4: datalemur-find-customer-referee.
SELECT
name
FROM Customer
WHERE COALESCE(referee_id, 1) <> 2 ;
--ex5: stratascratch the-number-of-survivors.
select  
survived,
SUM(CASE
    WHEN pclass = 1 THEN 1
    ELSE 0
END) AS first_class,
SUM(CASE
    WHEN pclass = 2 THEN 1
    ELSE 0
END) AS second_class,
SUM(CASE
    WHEN pclass = 3 THEN 1
    ELSE 0
END) AS third_class
from titanic
GROUP BY survived;
