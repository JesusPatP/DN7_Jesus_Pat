SELECT * FROM country co
inner join city ci;

SELECT * FROM country co
inner join city ci on co.country_id = ci.country_id;

SELECT ci.city_id, ci.country_id,ci.last_update FROM country co
inner join city ci on co.country_id = ci.country_id;

SELECT ci.city_id, ci.country_id,ci.last_update FROM country co
inner join city ci on co.country_id = ci.country_id where co.country_id = 2;

SELECT ci.city_id, ci.country_id,ci.last_update, co.country FROM country co
inner join city ci on co.country_id = ci.country_id where co.country_id = 2;

SELECT ci.city_id, ci.country_id,ci.last_update, co.country FROM country co
inner join city ci on co.country_id = ci.country_id where co.country_id = 4;