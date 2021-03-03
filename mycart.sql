Create Database mycart;
use mycart;

create table Category (categoryId integer not null auto_increment, 
categoryDescription varchar(255), categoryTitle varchar(255), primary key (categoryId))
 engine=InnoDB;
 
 create table Product (pId integer not null auto_increment, pDesc varchar(3000), 
 pDiscount integer not null, pName varchar(255), pPhoto varchar(255), pPrice integer not null, 
 pQuantity integer not null, category_categoryId integer, primary key (pId)) engine=InnoDB;
 
create table User (user_id integer not null auto_increment, user_address varchar(1500), 
user_email varchar(100), user_name varchar(100), user_password varchar(100), user_phone varchar(12), 
user_pic varchar(1500), user_type varchar(255), primary key (user_id)) engine=InnoDB;
