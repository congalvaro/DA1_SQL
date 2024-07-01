--ex1: hackerrank-average-population-of-each-continent.
SELECT country.continent AS continent, FLOOR(AVG(city.population)) AS average_population
FROM city
JOIN country ON city.countrycode = country.code
GROUP BY country.continent;
--ex2: datalemur-signup-confirmation-rate.
