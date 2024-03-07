SELECT 
	*
FROM 
	actor
WHERE 
	first_name like 'J%'
AND
	last_name like 'D%'
ORDER BY first_name;

SELECT 
	city
FROM 
	city
LEFT JOIN 
	country
ON 
	city.country_id = country.country_id
WHERE 
	country.country = 'Brazil'
ORDER BY 
	city.city DESC;


SELECT 
	COUNT(*) AS qtd_city
FROM 
	city
LEFT JOIN 
	country
ON 
	city.country_id = country.country_id
WHERE 
	country.country = 'Brazil';
    
SELECT 
	*
FROM 
	film_actor;
    
SELECT
	title AS movie_title
FROM 
	film_actor AS fm
INNER JOIN 
	actor AS a
ON 
	a.actor_id = fm.actor_id
INNER JOIN 
	film AS f
ON 
	f.film_id = fm.film_id
WHERE
	first_name = 'Dan'
AND 
	last_name = 'Harris';
    

SELECT 
	c.first_name, c.last_name, c.customer_id, f.title
FROM
	rental AS r
INNER JOIN
	customer AS c
ON 
	c.customer_id = r.customer_id
INNER JOIN 
	inventory as i
ON 
	r.inventory_id = i.inventory_id
INNER JOIN
	film AS f
ON
	f.film_id = i.film_id
WHERE 
	return_date IS NULL
AND 
	c.first_name = 'Florence'
AND 
	c.last_name = 'Woods';


SELECT
	l.name
FROM 
	language AS l
LEFT JOIN 	
	film AS f
ON 
	f.language_id = l.language_id
WHERE 
	f.film_id IS NULL
order by l.name;
    
SELECT 
	DISTINCT c.first_name, c.last_name, c.customer_id
FROM
	rental AS r
INNER JOIN
	customer AS c
ON 
	c.customer_id = r.customer_id
INNER JOIN 
	inventory as i
ON 
	r.inventory_id = i.inventory_id
WHERE 
	return_date IS NULL;
    
SELECT 
	fa.actor_id, a.first_name, a.last_name, COUNT(*) AS film_count
FROM 
	film_actor AS fa
INNER JOIN 
	film AS f
ON 
	f.film_id = fa.film_id
INNER JOIN
	actor AS a
ON 
	a.actor_id = fa.actor_id
GROUP BY
	fa.actor_id
ORDER BY
	film_count DESC
LIMIT 10;
