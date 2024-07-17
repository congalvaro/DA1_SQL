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
