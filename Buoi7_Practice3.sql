--ex1: hackerrank-more-than-75-marks.
Select Name From Students
Where Marks > 75
Order by right(name,3), ID;
--ex2: leetcode-fix-names-in-a-table.
Select user_id, 
CONCAT(UPPER(LEFT(name,1)),LOWER(RIGHT(name,LENGTH(name)-1))) AS name From Users
Order by user_id;
--ex3: datalemur-total-drugs-sales.
SELECT manufacturer, 
CONCAT('$',ROUND(SUM(total_sales/1000000)),' ','million') AS sales_mil
FROM pharmacy_sales
GROUP BY manufacturer 
Order by SUM(total_sales) DESC, manufacturer;
--ex4: avg-review-ratings.
SELECT EXTRACT(MONTH From submit_date) AS month,
product_id,
ROUND(AVG(stars),2) AS average_rating
FROM reviews
GROUP BY 
EXTRACT(MONTH From submit_date),
product_id
ORDER BY month, product_id;
--ex5: teams-power-users.
SELECT sender_id, count(message_id) AS message_count FROM messages
Where TO_CHAR(sent_date, 'mm yyyy')='08 2022'
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2;
--ex6: invalid-tweets.
Select tweet_id From Tweets
Where LENGTH(content)>15;
--ex7: user-activity-for-the-past-30-days.
Select activity_date AS day, count(DISTINCT user_id) AS active_users From Activity
Where activity_date > "2019-06-27" and activity_date <= "2019-07-27"
GROUP BY activity_date;
--ex8: number-of-hires-during-specific-time-period.
select count(id) AS hired_employee_count from employees
WHERE TO_CHAR(joining_date,'mm-yyyy') between '01-2022' and '07-2022';
--ex9: positions-of-letter-a.
select position('a' in first_name) from worker
where first_name  = 'Amitah';
--ex10: macedonian-vintages.
select designation AS wine, substring(title FROM LENGTH(winery) +2 FOR 4) from winemag_p2;
