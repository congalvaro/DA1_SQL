--ex1: datalemur-duplicate-job-listings.
WITH duplicate_count AS
(SELECT company_id, title, description, count(title) AS dup_count  FROM job_listings
GROUP BY company_id, title, description)
SELECT count(company_id) AS duplicate_companies FROM duplicate_count
WHERE dup_count > 1;
--ex2: datalemur-highest-grossing.
