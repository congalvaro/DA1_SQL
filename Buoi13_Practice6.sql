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

