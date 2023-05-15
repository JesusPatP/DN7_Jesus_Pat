/*insert cities*/
/*
insert into cities (cities.id_city,cities.name, cities.country_code) values ("1","CDMX",00810);
insert into cities (cities.id_city,cities.name, cities.country_code) values ("2","Oaxaca",68000);
insert into cities (cities.id_city,cities.name, cities.country_code) values ("3","Puebla de Zaragoza",72000);
insert into cities (cities.id_city,cities.name, cities.country_code) values ("4","Guadalajara",44100);
insert into cities (cities.id_city,cities.name, cities.country_code) values ("5","Monterrey",64000);
*/
/*insert roles*/
/*
insert into roles (roles.id_role,roles.name,roles.description) values ("1","admin","access to all system functions");
insert into roles (roles.id_role,roles.name,roles.description) values ("2","manager","access to manager functions");
insert into roles (roles.id_role,roles.name,roles.description) values ("3","coach","access to coach functions");
insert into roles (roles.id_role,roles.name,roles.description) values ("4","receptionist","access to receptionist functions");
insert into roles (roles.id_role,roles.name,roles.description) values ("5","concierge","access to concierge functions");
*/

/*insert roles*/
/*
insert into membership_types (membership_types.id_membership_type,membership_types.name,membership_types.duration,membership_types.cost,membership_types.create_date) values ("1","MemberFitness","720:00:00",15,"2023-05-07 03:02:00");
insert into membership_types (membership_types.id_membership_type,membership_types.name,membership_types.duration,membership_types.cost,membership_types.create_date) values ("2","MemberDay","24:00:00",5,"2023-05-07 03:02:00");
insert into membership_types (membership_types.id_membership_type,membership_types.name,membership_types.duration,membership_types.cost,membership_types.create_date) values ("3","FamilyMembers","720:00:00",48,"2023-05-07 03:02:00");
insert into membership_types (membership_types.id_membership_type,membership_types.name,membership_types.duration,membership_types.cost,membership_types.create_date) values ("4","Students","720:00:00",10,"2023-05-07 03:02:00");
insert into membership_types (membership_types.id_membership_type,membership_types.name,membership_types.duration,membership_types.cost,membership_types.create_date) values ("5","Vip","720:00:00",50,"2023-05-07 03:02:00");
*/

/*insert users*/
/*
insert into users (users.id_user,users.name, users.last_name, users.email, users.phone_number, users.cities_id_cities) values ("1",'Juan','Perez','juan_perez@test.com',9841389911,1);
insert into users (users.id_user,users.name, users.last_name, users.email, users.phone_number, users.cities_id_cities) values ("2",'Carlos','Perez','carlos_perez@test.com',9841389912,2);
insert into users (users.id_user,users.name, users.last_name, users.email, users.phone_number, users.cities_id_cities) values ("3",'Dionicio','Yam','dionicio_yam@test.com',9841389913,3);
insert into users (users.id_user,users.name, users.last_name, users.email, users.phone_number, users.cities_id_cities) values ("4",'Brayton','Samir','brayton_samir@test.com',9841389914,4);
insert into users (users.id_user,users.name, users.last_name, users.email, users.phone_number, users.cities_id_cities) values ("5",'Samir','Dionicio','samir_dionicio@test.com',9841389915,5);
*/

/*insert user in roles*/
/*
INSERT INTO `gym_manager`.`users_in_roles` (`id_users_in_roles`,`roles_id_roles`,`users_id_users`)VALUES("1","1","1");
INSERT INTO `gym_manager`.`users_in_roles` (`id_users_in_roles`,`roles_id_roles`,`users_id_users`)VALUES("2","2","2");
INSERT INTO `gym_manager`.`users_in_roles` (`id_users_in_roles`,`roles_id_roles`,`users_id_users`)VALUES("3","3","3");
INSERT INTO `gym_manager`.`users_in_roles` (`id_users_in_roles`,`roles_id_roles`,`users_id_users`)VALUES("4","4","4");
INSERT INTO `gym_manager`.`users_in_roles` (`id_users_in_roles`,`roles_id_roles`,`users_id_users`)VALUES("5","5","5");
*/

/*insert members*/
/*
INSERT INTO `gym_manager`.`members`(`id_member`,`name`,`last_name`,`email`,`birthday`,`gender`,`phone_number`,`joining_date`,`membership_types_id_membership_types`,`cities_id_cities`)
VALUES ("1","Karen","Tamer","karen_tamer@test.com","2004-07-22","F","9831214410","2023-05-07 03:02:00","1","1");
INSERT INTO `gym_manager`.`members`(`id_member`,`name`,`last_name`,`email`,`birthday`,`gender`,`phone_number`,`joining_date`,`membership_types_id_membership_types`,`cities_id_cities`)
VALUES ("2","Juan","Perez","juan_perez@test.com","2004-05-22","M","9831214411","2023-05-07 03:02:00","2","2");
INSERT INTO `gym_manager`.`members`(`id_member`,`name`,`last_name`,`email`,`birthday`,`gender`,`phone_number`,`joining_date`,`membership_types_id_membership_types`,`cities_id_cities`)
VALUES ("3","Carlos","Solis","carlos_solis@test.com","2002-05-22","M","9831214412","2023-05-07 03:02:00","3","3");
INSERT INTO `gym_manager`.`members`(`id_member`,`name`,`last_name`,`email`,`birthday`,`gender`,`phone_number`,`joining_date`,`membership_types_id_membership_types`,`cities_id_cities`)
VALUES ("4","Dionicio","Samir","samir@test.com","2003-05-22","M","9831214413","2023-05-07 03:02:00","4","4");
INSERT INTO `gym_manager`.`members`(`id_member`,`name`,`last_name`,`email`,`birthday`,`gender`,`phone_number`,`joining_date`,`membership_types_id_membership_types`,`cities_id_cities`)
VALUES ("5","Juan","Yam","juan_yam@test.com","2002-02-22","M","9831214413","2023-05-07 03:02:00","5","5");
*/

/*insert product_types*/
/*
INSERT INTO `gym_manager`.`product_types`(`id_product_type`,`name`,`cost`,`description`) VALUES ("1","Proteina",1000,"Rony coleman");
INSERT INTO `gym_manager`.`product_types`(`id_product_type`,`name`,`cost`,`description`) VALUES ("2","Botella de Agua",12,"100ml");
INSERT INTO `gym_manager`.`product_types`(`id_product_type`,`name`,`cost`,`description`) VALUES ("3","Gatorade",22,"Electrolitos 100ml");
INSERT INTO `gym_manager`.`product_types`(`id_product_type`,`name`,`cost`,`description`) VALUES ("4","Suero",25,"100ml");
INSERT INTO `gym_manager`.`product_types`(`id_product_type`,`name`,`cost`,`description`) VALUES ("5","Creatina",500,"1kg");
*/
/*insert equipment_type*/
/*
INSERT INTO `gym_manager`.`equipment_type`(`id_equipment_type`,`name`,`acquisition_date`,`description`) VALUES ("1","Caminadora","2023-05-07","Maquina para caminar"); 
INSERT INTO `gym_manager`.`equipment_type`(`id_equipment_type`,`name`,`acquisition_date`,`description`) VALUES ("2","Mancuerna 15lb","2023-05-07","Mancuerna de 15 lb"); 
INSERT INTO `gym_manager`.`equipment_type`(`id_equipment_type`,`name`,`acquisition_date`,`description`) VALUES ("3","Barra olimpica 45lb","2023-05-07","Barra olimpica de ejercicio"); 
INSERT INTO `gym_manager`.`equipment_type`(`id_equipment_type`,`name`,`acquisition_date`,`description`) VALUES ("4","Banco de ejercicio","2023-05-07","Banco para hacer ejercio"); 
INSERT INTO `gym_manager`.`equipment_type`(`id_equipment_type`,`name`,`acquisition_date`,`description`) VALUES ("5","Rag","2023-05-07","Soporte para barra olimpica"); 
*/

/*insert inventory*/
/*
INSERT INTO `gym_manager`.`inventory` (`id_inventory`,`amount`,`product_types_id_product_types`) VALUES("1",7,"1");
INSERT INTO `gym_manager`.`inventory` (`id_inventory`,`amount`,`product_types_id_product_types`) VALUES("2",5,"2");
INSERT INTO `gym_manager`.`inventory` (`id_inventory`,`amount`,`product_types_id_product_types`) VALUES("3",5,"3");
INSERT INTO `gym_manager`.`inventory` (`id_inventory`,`amount`,`product_types_id_product_types`) VALUES("4",5,"4");
INSERT INTO `gym_manager`.`inventory` (`id_inventory`,`amount`,`product_types_id_product_types`) VALUES("5",5,"5");
*/
/*insert sales*/
/*
INSERT INTO `gym_manager`.`sales` (`id_sale`,`sale_date`,`product_types_id_product_type`,`id_user_sale`) VALUES ("1","2023-05-07","1","1");
INSERT INTO `gym_manager`.`sales` (`id_sale`,`sale_date`,`product_types_id_product_type`,`id_user_sale`) VALUES ("2","2023-05-07","2","2");
INSERT INTO `gym_manager`.`sales` (`id_sale`,`sale_date`,`product_types_id_product_type`,`id_user_sale`) VALUES ("3","2023-05-07","3","1");
INSERT INTO `gym_manager`.`sales` (`id_sale`,`sale_date`,`product_types_id_product_type`,`id_user_sale`) VALUES ("4","2023-05-07","4","4");
INSERT INTO `gym_manager`.`sales` (`id_sale`,`sale_date`,`product_types_id_product_type`,`id_user_sale`) VALUES ("5","2023-05-07","5","3");
*/

/*Crear una vista que devuelva el listado de usuarios con los roles que tiene asignados.*/
/*
SELECT U.name as 'User', R.name as 'Rol' FROM users U 
join users_in_roles UR ON UR.users_id_users = U.id_user
join roles R ON R.id_role = UR.roles_id_roles;
*/

/*Crear una vista que devuelva el listado de productos en existencia con el tipo de producto al que pertenece.*/
/*
SELECT P.name as 'Producto', I.amount as 'Cantidad' FROM product_types P
join inventory I ON P.id_product_type = I.product_types_id_product_types
*/

/*Seleccionar el producto más vendido.*/
/*
SELECT P.name as 'Producto', I.amount as 'Amount' FROM product_types P, inventory I
WHERE I.amount = (SELECT MAX(amount) FROM inventory) and P.id_product_type = I.product_types_id_product_types;
*/

/*Seleccionar el último miembro registrado con el tipo de membresía adquirida.*/

SELECT M.name as 'Member', T.name as 'Type Membership', M.joining_date as "Create date" FROM members M, membership_types T
WHERE M.joining_date = (SELECT MAX(joining_date) FROM members) and M.membership_types_id_membership_types = T.id_membership_type;

