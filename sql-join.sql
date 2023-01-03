#List the number of films per category.
#Display the first and the last names, as well as the address, of each staff member.
#Display the total amount rung up by each staff member in August 2005.
#List all films and the number of actors who are listed for each film.
#Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.

use sakila;
select c.name, count(f.film_id) as number_of_films from film f
join film_category fc ON f.film_id = fc.film_id
join category c ON fc.category_id = c.category_id group by 1 order by 2 desc;

select c.last_name, sum(p.amount) as total_paid from payment p 
join customer c on p.customer_id = c.customer_id group by 1 order by 1;

select s.staff_id, s.first_name, s.last_name, sum(p.amount) as total_amount
from staff as s join payment as p on s.staff_id = p.staff_id
where payment_date regexp '2005-08-' group by s.staff_id;

select f.film_id, f.title as titulo, count(fa.actor_id) from film as f
left join film_actor as fa on f.film_id = fa.film_id group by f.film_id order by count(fa.actor_id) desc;

select c.customer_id, c.first_name, c.last_name, sum(p.amount) as total_amount from customer as c
join payment as p on c.customer_id = p.customer_id group by c.customer_id order by last_name asc;


