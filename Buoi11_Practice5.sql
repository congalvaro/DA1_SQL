--ex1: hackerrank-average-population-of-each-continent.
SELECT country.continent AS continent, FLOOR(AVG(city.population)) AS average_population
FROM city
JOIN country ON city.countrycode = country.code
GROUP BY country.continent;
--ex2: datalemur-signup-confirmation-rate.
SELECT ROUND(CAST(count(texts.email_id) AS decimal)/count(DISTINCT(emails.email_id)),2) AS activation_rate
FROM emails 
LEFT JOIN texts ON emails.email_id = texts.email_id
AND texts.signup_action = 'Confirmed';  
--ex3: datalemur-time-spent-snaps.
SELECT ag.age_bucket, 
ROUND(100.0*SUM(CASE WHEN act.activity_type = 'open' THEN act.time_spent ELSE 0 END)/SUM(act.time_spent),2) AS open_perc,
ROUND(100.0*SUM(CASE WHEN act.activity_type = 'send' THEN act.time_spent ELSE 0 END)/SUM(act.time_spent),2) AS send_perc
FROM activities AS act
JOIN age_breakdown AS ag 
ON act.user_id = ag.user_id
WHERE act.activity_type <> 'chat'
GROUP BY ag.age_bucket;
--ex4: datalemur-supercloud-customer.
SELECT cc.customer_id
FROM customer_contracts AS cc 
JOIN products AS p ON cc.product_id = p.product_id
GROUP BY cc.customer_id
HAVING COUNT(DISTINCT(p.product_category)) = 3;
--ex5: leetcode-the-number-of-employees-which-report-to-each-employee.
SELECT emp1.employee_id, emp1.name, count(*) AS reports_count, ROUND(AVG(emp2.age)) AS average_age
FROM Employees AS emp1
INNER JOIN Employees AS emp2 
ON emp1.employee_id = emp2.reports_to
GROUP BY employee_id
ORDER BY employee_id;
--ex6: leetcode-list-the-products-ordered-in-a-period.
SELECT p.product_name, SUM(o.unit) AS unit
FROM Products AS p
JOIN Orders AS o
ON p.product_id = o.product_id
WHERE o.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY p.product_name
HAVING SUM(o.unit) >= 100;
--ex7: leetcode-sql-page-with-no-likes.
SELECT pg.page_id
FROM pages AS pg  
LEFT JOIN page_likes AS pgl ON pg.page_id = pgl.page_id
WHERE pgl.page_id IS NULL
ORDER BY pg.page_id ASC;
