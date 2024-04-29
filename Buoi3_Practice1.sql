--ex1: hackerank-revising-the-select-query
Select NAME from CITY
Where population > 120000 and countrycode = 'USA';
--ex2: hackerank-japanese-cities-attributes
SELECT * from CITY
WHERE countrycode = 'JPN';
--ex3: hackerank-weather-observation-station-1
SELECT city, state from STATION;
--ex4: hackerank-weather-observation-station-6
SELECT DISTINCT city from STATION
WHERE city LIKE 'A%'
OR city LIKE 'E%'
OR city LIKE 'I%'
OR city LIKE 'O%'
OR city LIKE 'U%';
--ex5: hackerank-weather-observation-station-7
SELECT DISTINCT CITY from STATION
WHERE CITY LIKE '%a'
OR CITY LIKE '%e'
OR CITY LIKE '%i'
OR CITY LIKE '%o'
OR CITY LIKE '%u';
--ex6: hackerank-weather-observation-station-9
SELECT DISTINCT city from STATION
WHERE NOT (city LIKE 'A%'
OR city LIKE 'E%'
OR city LIKE 'I%'
OR city LIKE 'O%'
OR city LIKE 'U%');
--ex7: hackerank-name-of-employees
SELECT name from Employee
ORDER BY name ASC;
--ex8: hackerank-salary-of-employees
SELECT name from Employee
WHERE salary > 2000 
AND months < 10
ORDER BY employee_id ASC;
--ex9: leetcode-recyclable-and-low-fat-products
SELECT product_id from PRODUCTS
WHERE low_fats = 'Y'
AND recyclable = 'Y';
--ex10: leetcode-find-customer-referee
SELECT name from Customer
WHERE referee_id <> 2
OR referee_id IS NULL;
--ex11: leetcode-big-countries
SELECT name, population, area from World
WHERE area >= 3000000 
OR population >= 25000000;
--ex12: leetcode-article-views
SELECT DISTINCT author_id as id from Views
WHERE author_id = viewer_id
ORDER BY id ASC;
--ex13: datalemur-tesla-unfinished-part
SELECT part, assembly_step FROM parts_assembly
WHERE finish_date IS NULL;
--ex14: datalemur-lyft-driver-wages
select * from lyft_drivers
WHERE yearly_salary <= 30000
OR yearly_salary>= 70000;
--ex15: datalemur-find-the-advertising-channel
select * from uber_advertising
WHERE money_spent > 100000
AND year = 2019;
