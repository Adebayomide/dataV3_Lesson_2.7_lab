-- How many films are there for each of the categories in the category table. Use appropriate join to write this query.

SELECT c.name as category, COUNT(*) as film_count
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY c.name;

-- Display the total amount rung up by each staff member in August of 2005.

SELECT s.first_name, s.last_name, SUM(p.amount) as total_amount
FROM payment p
JOIN staff s ON p.staff_id = s.staff_id
WHERE p.payment_date BETWEEN '2005-01-01' AND '2005-12-31'
GROUP BY s.staff_id;


-- Which actor has appeared in the most films?

SELECT a.actor_id, a.first_name, a.last_name, COUNT(*) as film_count
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY film_count DESC
LIMIT 1;

-- Most active customer (the customer that has rented the most number of films)

SELECT c.customer_id, c.first_name, c.last_name, COUNT(*) as rental_count
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY rental_count DESC
LIMIT 1;



-- Display the first and last names, as well as the address, of each staff member.

SELECT first_name, last_name, address_id
FROM staff;


--	List each film and the number of actors who are listed for that film



select f.title, COUNT(*) as actor_count
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
GROUP BY f.film_id;


-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
-- List the customers alphabetically by last name.


SELECT c.last_name, c.first_name, SUM(p.amount) as total_paid
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY c.last_name;





--	List number of films per category.

SELECT c.name as category_name, COUNT(*) as film_count
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY c.category_id;

