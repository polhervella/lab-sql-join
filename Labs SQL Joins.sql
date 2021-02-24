-- Labs SQL Join

-- List number of films per category.

SELECT name,count(film_table.film_id) as number_of_films
FROM sakila.film as film_table
JOIN sakila.film_category as film_category_table on film_table.film_id = film_category_table.film_id
JOIN sakila.category as category_table on film_category_table.category_id = category_table.category_id
GROUP BY name
ORDER BY count(film_table.film_id) desc;

-- Display the first and last names, as well as the address, of each staff member.

SELECT first_name,last_name, address
FROM sakila.staff as staff_table
JOIN sakila.address as address_table on staff_table.address_id = address_table.address_id;

-- Display the total amount rung up by each staff member in August of 2005.

SELECT first_name,last_name,sum(amount)
FROM sakila.staff as staff_table
JOIN sakila.payment as payment_table on staff_table.staff_id = payment_table.staff_id
WHERE date_format(convert(payment_date,date),'%Y') = 2005 AND date_format(convert(payment_date,date),'%M') = 'August'
GROUP BY first_name,last_name;

-- List each film and the number of actors who are listed for that film.

SELECT title, count(actor_id) as number_of_actors
FROM sakila.film as film_table
JOIN sakila.film_actor as film_actor_table on film_table.film_id = film_actor_table.film_id
GROUP BY title;

-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

SELECT first_name,last_name,sum(amount) as 'total_paid by_customer'
FROM sakila.payment as payment_table 
JOIN sakila.customer as customer_table on payment_table.customer_id = customer_table.customer_id
GROUP BY first_name,last_name
ORDER BY last_name;



