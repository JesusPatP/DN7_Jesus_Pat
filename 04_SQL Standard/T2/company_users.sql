alter table users 
add constraint company_users
foreign key (idcompany)
references company (idcompany);

alter table users
add index company_users_idx (idcompany ASC) VISIBLE;