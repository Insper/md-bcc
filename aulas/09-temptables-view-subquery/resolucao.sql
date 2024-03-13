SELECT 
	c.name, SUM(p.amount) AS receita
FROM
	payment AS p
INNER JOIN 
	rental AS r
ON 
	r.rental_id = p.rental_id
INNER JOIN 
	inventory AS i
ON
	i.inventory_id = r.inventory_id
INNER JOIN
	film_category AS fc
ON
	fc.film_id = i.film_id
INNER JOIN 
	category AS c
ON
	c.category_id = fc.category_id
GROUP BY
	c.name
ORDER BY 
	receita DESC;

SELECT
	f.title, COUNT(rental_id) AS qtd_alugada
FROM
	rental AS r
INNER JOIN 
	inventory AS i
ON
	i.inventory_id = r.inventory_id
INNER JOIN
	film AS f
ON
	f.film_id = i.film_id
GROUP BY
	f.film_id
ORDER BY
	qtd_alugada DESC
LIMIT 10;

SELECT 
    * 
FROM 
    movie_count 
ORDER BY
    cnt DESC
LIMIT 30;

SELECT 
	film_id INTO @id_cowboy
FROM
	film
WHERE 
	film.title = 'COWBOY DOOM';
    
SELECT
	i.inventory_id INTO @id_invent
FROM
	inventory as i
WHERE 
	i.film_id = @id_cowboy
LIMIT 1;
    
SELECT 
	staff_id INTO @id_jon
FROM 
	staff
WHERE
	staff.first_name = 'Jon'
AND
	staff.last_name = 'Stephens';
	
SELECT 
	customer_id INTO @id_jessie
FROM 
	customer AS c
WHERE
	c.first_name = 'JESSIE'
AND
	c.last_name = 'BANKS';
    
SELECT @id_invent;
	

INSERT INTO 
	rental (rental_date, inventory_id, customer_id, return_date,
    staff_id, last_update)
VALUES ('2019-01-01', @id_invent, @id_jessie, '2019-01-08', @id_jon, '2019-01-08');
