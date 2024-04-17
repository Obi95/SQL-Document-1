-- Question 1
-- 1. How many actors are there with the last name ‘Wahlberg’?
-- Answer: 2 
select count(last_name)
from actor
where last_name like 'Wahlberg'

-- Question 2
-- 2. How many payments were made between $3.99 and $5.99?
-- ANSWER: 5,602

select count(amount)
from payment
where amount between 3.99 and 5.99;

-- Question 3
-- 3. What film does the store have the most of? (search in inventory) 
-- ANSWER: film_id 350 inventory_count 8

select film_id, count(inventory_id) as inventory_count
from inventory
group by film_id
order by inventory_count desc
limit 1;


-- Question 4
-- 4. How many customers have the last name ‘William’? 
-- ANSWER: 0

select last_name
from customer
where last_name like 'William';

-- Question 5
-- What store employee (get the id) sold the most rentals?
-- ANSWER: staff_id 1 Most_rented 8,040

select staff_id, count(inventory_id) as most_rented
from rental
group by staff_id
order by most_rented desc
limit 1;

-- Question 6
-- How many different district names are there?
-- ANSWER: 378

select count(distinct(district))
from address


-- Question 7
-- What film has the most actors in it? (use film_actor table and get film_id)
-- ANSWER: film_id 508 actor_count 15

select film_id, count(actor_id) as actor_count
from film_actor
group by film_id
order by actor_count desc


-- Question 8
-- From store_id 1, how many customers have a last name ending with 'es'? (use customer table)
-- ANSWER: 13

select count(*) as es_lastnames
from customer
where store_id = 1 and last_name like '%es'


-- Question 9
-- How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers with ids 
-- between 380 and 430? (use group by and having >250)
-- ANSWER:3   amount 2.99 count 290
--            amount 4.99 count 281
--            amount 0.99 count 269

select amount, count(rental_id)
from payment
where customer_id between 380 and 430
group by amount 
having count(rental_id) > 250;


--select amount, customer_id, rental_id
--from payment
--where customer_id between 380 and 430




-- Question 10
-- Within the film table, how many rating categories are there? and what rating has the most movies total?
-- ANSWER: 5 Categories and PG-13 has the most with 223 movie_count


select rating, count(*) as movie_count
from film
group by rating
order by movie_count desc

