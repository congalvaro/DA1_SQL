--Bai1
SELECT DISTINCT replacement_cost FROM public.film
ORDER BY replacement_cost ASC;
--Bai2
SELECT
SUM(CASE 
	WHEN   replacement_cost BETWEEN 9.99 AND  19.99 THEN 1 ELSE 0
END) AS low,
SUM(CASE 
	WHEN   replacement_cost BETWEEN 20.00 AND 24.99 THEN 1
	ELSE 0
END) AS medium,
SUM(CASE 
	WHEN  replacement_cost BETWEEN 25.00 AND 29.99 THEN 1
	ELSE 0
END) AS high
FROM film;
--Bai3
SELECT f.title, f.length, c.name
FROM public.film AS f
JOIN public.film_category AS fc ON f.film_id = fc.film_id
JOIN public.category AS c ON fc.category_id = c.category_id
AND c.name IN ('Drama','Sports')
ORDER BY f.length DESC;
--Bai4
SELECT 
c.name, COUNT(f.title) AS film_count
FROM public.film AS f
JOIN public.film_category AS fc ON f.film_id = fc.film_id
JOIN public.category AS c ON fc.category_id = c.category_id
GROUP BY C.name
ORDER BY film_count DESC
--Bai5
SELECT a.first_name, a.last_name, COUNT(fa.film_id) AS film_count
FROM actor AS a
JOIN film_actor AS fa 
ON a.actor_id = fa.actor_id
GROUP BY a.first_name, a.last_name
ORDER BY film_count DESC;
--Bai6
SELECT COUNT(*) AS null_count
FROM address AS add
LEFT JOIN customer AS cus
ON add.address_id = cus.address_id
WHERE cus.customer_id IS NULL;
--Bai7
SELECT city.city, SUM(pay.amount) AS revenue
FROM city AS city
JOIN address AS add ON city.city_id = add.city_id
JOIN customer AS cus ON add.address_id = cus.address_id
JOIN payment AS pay ON cus.customer_id = pay.customer_id
GROUP BY city.city
ORDER BY revenue DESC;
--Bai8
SELECT city.city, coun.country, SUM(pay.amount) AS revenue
FROM country AS coun
JOIN city AS city ON city.country_id = coun.country_id
JOIN address AS add ON city.city_id = add.city_id
JOIN customer AS cus ON add.address_id = cus.address_id
JOIN payment AS pay ON cus.customer_id = pay.customer_id
GROUP BY city.city, coun.country
ORDER BY revenue ASC;
