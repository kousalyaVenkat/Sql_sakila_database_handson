-- 7e. Display the most frequently rented movies in descending order.

select * from film;
select * from inventory;
select * from rental;

select f.title,f.film_id,b.*
from film f
join (select i.film_id,count(r.rental_id) as most_rented from rental r join inventory i on i.inventory_id=r.inventory_id group by i.film_id) b
on f.film_id=b.film_id
order by most_rented desc;

-- 7f. Write a query to display how much business, in dollars, each store brought in.

select * from store;
select * from inventory;
select * from payment;
select * from customer;


-- 7g. Write a query to display for each store its store ID, city, and country.
select * from store;
select * from address;
select * from city;
select * from country;


select s.store_id,c.city,c1.country from store s
join address a
on s.address_id=a.address_id
join city c
on a.city_id=c.city_id
join country c1
on c.country_id=c1.country_id
group by s.store_id




