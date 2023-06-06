use sakila;

select * from film;
select * from film_actor;
-- 6c. List each film and the number of actors who are listed for that film. Use tables film_actor and film. Use inner join.
select f.title,count(*)as num_of_Actors
from film f
join film_actor fa
on f.film_id=fa.film_id
group by  f.title
order by num_of_Actors desc;

-- 6d. How many copies of the film Hunchback Impossible exist in the inventory system?

select * from inventory;

select f.title,count(*)
from film f
inner join inventory i
on f.film_id=i.film_id
where lower(f.title)=lower('Hunchback Impossible')
group by f.title;


-- 6e. Using the tables payment and customer and the JOIN command, list the total paid by each customer.
--  List the customers alphabetically by last name:

select * from payment;
select * from customer;

select c.first_name,c.last_name,sum(p.amount)
from payment p
join customer c
on p.customer_id=c.customer_id
group by c.first_name,c.last_name
order by c.last_name asc; 


-- 7a. The music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, films starting with the letters K and Q have also soared in popularity. 
-- Use subqueries to display the titles of movies starting with the letters K and Q whose language is English.

select * from film;
select * from language;

select title 
from film
where (title like 'K%' or title like 'Q%')
and language_id in 
(select language_id  
from language 
where language.name="English")
order by title;

-- 7b. Use subqueries to display all actors who appear in the film Alone Trip.

select * from film;
select * from film_actor;
select * from actor;


select first_name,last_name from actor
where actor_id in (select actor_id from film_actor where film_id in (select film_id from film where title="ALONE TRIP"));


------------------------------------------------------------------------------------------------------------------------------------------
-- 7c. You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers. 
-- Use joins to retrieve this information.

select * from customer;
select * from address;
select * from city;
select * from country;

-- using subquery
select first_name,last_name,email from customer
where address_id in (select address_id from address
where city_id in (select city_id from city
where country_id in (select country_id from country where country="Canada")));

-- using join 

select c.first_name,c.last_name,c.email
from customer c
join address a
on c.address_id=a.address_id
join city c1
on a.city_id=c1.city_id
join country c2
on c1.country_id=c2.country_id
where lower(c2.country)=lower('canada');

-- 7d. Sales have been lagging among young families, and you wish to target all family movies for a promotion.
--  Identify all movies categorized as family films.

select * from film;
select * from film_category;
select * from category;

-- using subquery

select film_id,title,release_year 
from film 
where film_id in (select film_id from film_category
where category_id in (select category_id from category where name="Family")); 

-- using join

select f.film_id,f.title,f.release_year
from film f
join film_category fc
on f.film_id=fc.film_id
join category c
on fc.category_id=c.category_id
where c.name="Family";


-- 7e. Display the most frequently rented movies in descending order.

select * from film;
select * from inventory;
select * from rental;













