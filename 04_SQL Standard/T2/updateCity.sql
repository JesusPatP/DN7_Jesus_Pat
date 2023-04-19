SELECT * FROM sqltesting.city;

update city set name = 'Los Ángeles' where idcity = 4;

update city set name = 'La Habana' where idcity = 8; 

SELECT * FROM city ci inner join country co on ci.idcountry = co.idcountry;

delete from city where idcity = 3;

update city set name = 'Medellín',idcountry = 3 where idcity = 9;

update city set name = 'Barranquilla',idcountry = 3 where idcity = 10;  

update city left join country co on city.idcountry = country.idcountry
set city.idcountry = 4 where country.idcountry is null;
