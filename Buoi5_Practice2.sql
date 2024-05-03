--ex1: hackerrank-weather-observation-station-3.
SELECT DISTINCT CITY FROM STATION
where ID%2=0;
--ex2: hackerrank-weather-observation-station-4.
SELECT COUNT(CITY) - COUNT(DISTINCT(CITY)) FROM STATION;
--ex3: hackerrank-the-blunder.

--ex4: datalemur-alibaba-compressed-mean.
SELECT 
ROUND(CAST(SUM(item_count*order_occurrences)/SUM(order_occurrences)
AS DECIMAL),1) AS mean FROM items_per_order;
--ex5: datalemur-matching-skills.
SELECT candidate_id FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING count(skill) = 3
ORDER BY candidate_id;
--ex6: datalemur-verage-post-hiatus-1.
SELECT user_id,
MAX(DATE(post_date)) - MIN(DATE(post_date)) As days_between
FROM posts
WHERE post_date BETWEEN '01/01/2021' AND '01/01/2022'
GROUP BY user_id
HAVING COUNT(post_id)>=2;
--ex7: datalemur-cards-issued-difference.
SELECT card_name, 
MAX(issued_amount) - MIN(issued_amount) as difference
FROM monthly_cards_issued
GROUP BY card_name
ORDER By difference DESC;
--ex8: datalemur-non-profitable-drugs.
SELECT manufacturer, 
COUNT (drug) AS drug_sold,
ABS(SUM(cogs - total_sales)) AS total_loss
FROM pharmacy_sales 
WHERE total_sales< cogs
GROUP BY manufacturer
ORDER BY total_loss DESC ;
--ex9: leetcode-not-boring-movies.
select * FROM Cinema
where id%2=1 AND description<>'boring'
order by rating DESC;
--ex10: leetcode-number-of-unique-subject.
SELECT teacher_id, count(distinct(subject_id)) AS cnt FROM Teacher
GROUP BY teacher_id;
--ex11: leetcode-find-followers-count.
Select user_id, count(follower_id ) As followers_count From Followers
GROUP BY user_id
Order by user_id;
--ex12:leetcode-classes-more-than-5-students.
Select class from Courses 
GROUP BY class
Having count(student)>5
