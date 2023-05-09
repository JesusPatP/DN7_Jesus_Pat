#
SELECT * FROM film_actor;

#
SELECT count(*), actor_id FROM film_actor
group by actor_id;

#
SELECT 
count(*) total_films, actor_id
FROM film_actor
group by actor_id;

#
select max(total_films),actor_id
from(
SELECT 
count(*) total_films, actor_id
FROM film_actor
group by actor_id
) sub
group by actor_id;

#
select max(total_films)
from(
SELECT 
count(*) total_films, actor_id
FROM film_actor
group by actor_id
) sub;

#
SELECT 
    *
FROM
    (SELECT 
        MAX(total_films) max_films
    FROM
        (SELECT 
        COUNT(*) total_films, actor_id
    FROM
        film_actor
    GROUP BY actor_id) sub) sub_max
        INNER JOIN
    (SELECT 
        COUNT(*) total_films, actor_id
    FROM
        film_actor
    GROUP BY actor_id) sub2 ON sub_max.max_films = sub2.total_films;
    
#
SELECT 
    sub2.total_films,
    a.actor_id,
    a.first_name,
    a.last_name
FROM
    (SELECT 
        MAX(total_films) max_films
    FROM
        (SELECT 
        COUNT(*) total_films, actor_id
    FROM
        film_actor
    GROUP BY actor_id) sub) sub_max
        INNER JOIN
    (SELECT 
        COUNT(*) total_films, actor_id
    FROM
        film_actor
    GROUP BY actor_id) sub2 ON sub_max.max_films = sub2.total_films
    inner join actor a on a.actor_id = sub2.actor_id;


#
SELECT 
    sub2.total_films,
    a.actor_id,
    a.first_name,
    a.last_name
FROM
    (SELECT 
        min(total_films) max_films
    FROM
        (SELECT 
        COUNT(*) total_films, actor_id
    FROM
        film_actor
    GROUP BY actor_id) sub) sub_max
        INNER JOIN
    (SELECT 
        COUNT(*) total_films, actor_id
    FROM
        film_actor
    GROUP BY actor_id) sub2 ON sub_max.max_films = sub2.total_films
    inner join actor a on a.actor_id = sub2.actor_id;
    
#Union
SELECT 
    'Menor cantidad' query_type,
    sub2.total_films,
    a.actor_id,
    a.first_name,
    a.last_name
FROM
    (SELECT 
        min(total_films) max_films
    FROM
        (SELECT 
        COUNT(*) total_films, actor_id
    FROM
        film_actor
    GROUP BY actor_id) sub) sub_max
        INNER JOIN
    (SELECT 
        COUNT(*) total_films, actor_id
    FROM
        film_actor
    GROUP BY actor_id) sub2 ON sub_max.max_films = sub2.total_films
    inner join actor a on a.actor_id = sub2.actor_id
    
    union 
    
    SELECT 
    'Mayor cantidad' query_type,
    sub2.total_films,
    a.actor_id,
    a.first_name,
    a.last_name
FROM
    (SELECT 
        max(total_films) max_films
    FROM
        (SELECT 
        COUNT(*) total_films, actor_id
    FROM
        film_actor
    GROUP BY actor_id) sub) sub_max
        INNER JOIN
    (SELECT 
        COUNT(*) total_films, actor_id
    FROM
        film_actor
    GROUP BY actor_id) sub2 ON sub_max.max_films = sub2.total_films
    inner join actor a on a.actor_id = sub2.actor_id;
    