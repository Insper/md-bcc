SELECT 
    a.first_name, a.last_name
FROM 
    actor a 
GROUP BY 
    a.last_name
HAVING
    COUNT(a.first_name) = 1
ORDER BY
    a.last_name, a.first_name;
    
SELECT
	AVG(f.length) AS duracao_media_drama
FROM 
	film_category AS fc
INNER JOIN 
	film AS f
ON 
	f.film_id = fc.film_id
INNER JOIN
	category AS c
ON
	c.category_id = fc.category_id
WHERE
	c.name = 'Drama';
    
SELECT 
	c.name, AVG(f.length) AS avg_len
FROM
	film_category AS fc
INNER JOIN 
	film AS f
ON 
	f.film_id = fc.film_id
INNER JOIN
	category AS c
ON
	c.category_id = fc.category_id
GROUP BY
	c.category_id
ORDER BY
	avg_len DESC;
    
SELECT 
	c.name, AVG(f.length) AS avg_len
FROM
	film_category AS fc
INNER JOIN 
	film AS f
ON 
	f.film_id = fc.film_id
INNER JOIN
	category AS c
ON
	c.category_id = fc.category_id
GROUP BY
	c.category_id
HAVING 
	avg_len > 120
ORDER BY
	avg_len DESC;
    
SELECT
	 a.first_name, a.last_name, COUNT(*) AS film_count
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
	a.actor_id
HAVING
	film_count >= 35
AND 
	film_count <= 40
ORDER BY
	film_count DESC, a.first_name ASC, a.last_name ASC

 