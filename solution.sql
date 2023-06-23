-- 1. Select all the actors with the first name ‘Scarlett’.

SELECT * FROM actor WHERE first_name = 'Scarlett';

-- 2. How many physical copies of movies are available for rent in the store's inventory? How many unique movie titles are available?

SELECT COUNT(*) AS physical_copy_count, COUNT(DISTINCT(film_id)) AS film_titles_available FROM inventory;

-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.

SELECT MAX(length) AS max_duration, MIN(length) AS min_duration FROM film;

-- 4. What's the average movie duration expressed in format (hours, minutes)?

SELECT CONCAT(FLOOR(avg(length)/60),', ', ROUND(MOD(AVG(length),60))) AS average_length  FROM film;

-- 5. How many distinct (different) actors' last names are there?

SELECT COUNT( DISTINCT(last_name)) as unique_last_names FROM actor;

-- 6. How many days was the company operating? Assume the last rental date was their closing date. (check DATEDIFF() function)

SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS number_of_operating_days FROM rental;

-- 7. Show rental info with additional columns month and weekday. Get 20 results.

SELECT *, MONTH(rental_date) AS rental_date_month, WEEKDAY(rental_date) AS rental_date_weekday from rental LIMIT 20;

-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT *, IF(WEEKDAY(rental_date) < 5, 'workday', 'weekday') as workday_weekend
FROM rental;

-- 9. Get release years.

SELECT DISTINCT release_year FROM film;

-- 10. Get all films with ARMAGEDDON in the title.

SELECT * FROM film WHERE title LIKE '%ARMAGEDDON%';

-- 11. Get all films which title ends with APOLLO.

SELECT * FROM film WHERE title LIKE '%APOLLO';

-- 12. Get 10 the longest films.

SELECT * FROM film ORDER BY length DESC LIMIT 10;

-- 13. How many films include Behind the Scenes content?

SELECT count(*) as behind_the_scenes_count FROM film WHERE special_features LIKE '%Behind the Scenes%';