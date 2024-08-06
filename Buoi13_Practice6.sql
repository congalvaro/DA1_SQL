--ex1: datalemur-duplicate-job-listings.
WITH duplicate_count AS
(SELECT company_id, title, description, count(title) AS dup_count  FROM job_listings
GROUP BY company_id, title, description)
SELECT count(company_id) AS duplicate_companies FROM duplicate_count
WHERE dup_count > 1;
--ex2: datalemur-highest-grossing.
WITH ranked_list AS
(
SELECT 
  category, 
  product, 
  SUM(spend) AS total_spend,
  RANK() OVER(PARTITION BY category ORDER BY SUM(spend) DESC) AS rank_spend
FROM product_spend
WHERE EXTRACT(YEAR FROM transaction_date)= 2022
GROUP BY category, product)
SELECT category, product, total_spend FROM ranked_list
WHERE rank_spend <= 2;
--ex3: datalemur-frequent-callers.
WITH holder_count AS
(
SELECT policy_holder_id, count(case_id) AS call_count FROM callers
GROUP BY policy_holder_id
HAVING count(case_id) >= 3)
SELECT count(*) AS policy_holder_count FROM holder_count;
--ex4: datalemur-page-with-no-likes.
WITH like_count AS
(
SELECT p.page_id, count(pl.user_id) 
FROM pages p
LEFT JOIN page_likes pl ON p.page_id = pl.page_id
GROUP BY p.page_id
HAVING count(pl.user_id) = 0)
SELECT page_id FROM like_count;
--ex5: datalemur-user-retention.
SELECT EXTRACT(MONTH FROM curr_month.event_date) AS month, 
      count(DISTINCT curr_month.user_id) AS monthly_active_users
FROM user_actions AS curr_month
WHERE EXISTS (
SELECT EXTRACT(MONTH FROM last_month.event_date) AS month,
        last_month.user_id
FROM user_actions AS last_month
WHERE curr_month.user_id = last_month.user_id
    AND EXTRACT(MONTH FROM last_month.event_date) =
    EXTRACT(MONTH FROM curr_month.event_date - INTERVAL '1 MONTH'))
      AND EXTRACT(MONTH FROM curr_month.event_date) = 7
      AND EXTRACT(YEAR FROM curr_month.event_date) = 2022
GROUP BY EXTRACT(MONTH FROM event_date);
--ex6: leetcode-monthly-transactions.
WITH approved_transactions AS
(SELECT TO_CHAR(trans_date, 'yyyy-mm') AS month, 
        country,
        count(*) AS approved_count,
        sum(amount) AS approved_total_amount
FROM Transactions 
WHERE state ='approved'
GROUP BY TO_CHAR(trans_date, 'yyyy-mm'), country),
incoming_transactions AS 
(SELECT TO_CHAR(trans_date, 'yyyy-mm') AS month,
        country,
        count(*) AS trans_count,
        sum(amount) AS trans_total_amount
FROM Transactions
GROUP BY TO_CHAR(trans_date, 'yyyy-mm'), country)
SELECT it.month,
        it.country,
        it.trans_count,
        it.trans_total_amount,
        at.approved_count,
        at.approved_total_amount
FROM incoming_transactions AS it
JOIN approved_transactions AS at
    ON it.month = at.month AND it.country = at.country;
--ex7: leetcode-product-sales-analysis.
WITH a AS
(SELECT s.product_id,
        s.year, 
        s.quantity,
        s.price,
        RANK() OVER(PARTITION BY s.product_id
        ORDER BY s.year ASC) AS rank
FROM Sales AS s
JOIN Product AS p ON s.product_id = p.product_id)
SELECT product_id,
        year AS first_year,
        quantity,
        price
FROM a
WHERE rank = 1;
--ex8: leetcode-customers-who-bought-all-products.
WITH cus AS
(SELECT customer_id,
        count(product_key) AS product_count
FROM Customer
GROUP BY customer_id)
SELECT customer_id
FROM cus
WHERE product_count =  (SELECT count(*) FROM Product);
--ex9: leetcode-employees-whose-manager-left-the-company.
SELECT employee_id
FROM Employees
WHERE salary < 30000
AND manager_id IS NOT NULL
AND manager_id NOT IN (SELECT employee_id FROM Employees)
ORDER BY employee_id;
--ex10: leetcode-primary-department-for-each-employee.
WITH company_count AS 
(SELECT company_id, title, description, count(*) AS count_dup 
FROM job_listings
GROUP BY company_id, title, description)
SELECT count(company_id)
FROM company_count
WHERE count_dup >= 2;
--ex11: leetcode-movie-rating.
WITH name_chosen AS
(SELECT u.name AS results
FROM MovieRating AS mr
JOIN Users AS u ON u.user_id = mr.user_id
GROUP BY u.name
ORDER BY u.name, count(mr.*) DESC
LIMIT 1),
title_chosen AS
(SELECT m.title 
FROM MovieRating AS mr
JOIN Movies AS m ON mr.movie_id = m.movie_id
WHERE EXTRACT(YEAR FROM mr.created_at) = 2020
AND EXTRACT(MONTH FROM mr.created_at) = 2
GROUP BY m.title
ORDER BY  AVG(mr.rating) DESC, m.title ASC 
LIMIT 1)
SELECT * FROM name_chosen
UNION ALL
SELECT * FROM title_chosen
--ex12: leetcode-who-has-the-most-friends.
WITH friend_list AS
(SELECT requester_id AS friend FROM RequestAccepted
UNION ALL 
SELECT accepter_id AS friend FROM RequestAccepted)
SELECT friend AS id, count(*) AS num FROM friend_list
GROUP BY friend
ORDER BY count(*) DESC
LIMIT 1;
