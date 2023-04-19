
#Peliculas del año 2006
select distinct(release_year) from film f;

#Filtrar por la columna rating
select distinct(rating) from film f;

select count(*) from film f;

#Contar el numero de peliculas por el rating
select count(*), rating from film f
group by rating;

#Contar el numero de peliculas por el rating con el conteo mayor a 200
select count(*), rating from film f
group by rating having count(*) > 200;

#Contar el numero de peliculas por el rating con el conteo mayor a 200 con aleas al count
select count(*) total_films, rating from film f
group by rating having count(*) > 200;

#
select 
	c.name,
    sub.rating,
    sub.total_films
from film f
inner join film_category fc on f.film_id = fc.film_id
inner join category c on fc.category_id = c.category_id
inner join (
select count(*) total_films, rating from film f
group by rating having count(*) > 200
)sub on f.rating = sub.rating
group by 
    c.name,
    sub.rating,
    sub.total_films
order by sub.total_films desc


