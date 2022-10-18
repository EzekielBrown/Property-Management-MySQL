CREATE TABLE IF NOT EXISTS staff
(
	staff_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
	staff_position varchar(80) NOT NULL,
	first_name varchar(30) NOT NULL,
	last_name varchar(30) NOT NULL,
	email varchar(100) NOT NULL UNIQUE,
	phone varchar(15) NOT NULL,
	username varchar(30) NOT NULL,
	password varchar(30) NOT NULL,
	is_active bit
);

CREATE TABLE IF NOT EXISTS inspection
(
	inspection_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
	inspection_date date NOT NULL,
	pass bit NOT NULL,
	comment varchar(500)
);

CREATE TABLE IF NOT EXISTS lease
(
	lease_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
	rent_amount decimal(19,0) NOT NULL,
	rent_period varchar(11) NOT NULL,
	bond_amount decimal(19,0) NOT NULL,
	bond_paid bit NOT NULL,
	start_date date NOT NULL,
	end_date date NOT NULL
);

CREATE TABLE IF NOT EXISTS client
(
	client_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
	first_name varchar(30) NOT NULL,
	last_name varchar(30) NOT NULL,
	address varchar(255),
	city varchar(80),
	postal_code varchar(4),
	email varchar(100) NOT NULL UNIQUE,
	phone varchar(15) NOT NULL,
	company varchar(100)
);


CREATE TABLE IF NOT EXISTS branch
(
	branch_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
	company_id varchar(10) NOT NULL,
	name varchar(100) NOT NULL,
	address varchar(255) NOT NULL,
	city varchar(80) NOT NULL,
	postal_code varchar(4) NOT NULL,
	phone varchar(15) NOT NULL,
	email varchar(100) NOT NULL UNIQUE
	
);

CREATE TABLE IF NOT EXISTS owner
(
	owner_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
	first_name varchar(30) NOT NULL,
	last_name varchar(30) NOT NULL,
	company varchar(100),
	address varchar(255) NOT NULL,
	city varchar(80) NOT NULL,
	postal_code varchar(4) NOT NULL,
	phone varchar(15) NOT NULL,
	email varchar(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS property
(
	property_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
	address varchar(255) NOT NULL,
	city varchar(80) NOT NULL,
	postal_code varchar(4) NOT NULL
);

CREATE TABLE IF NOT EXISTS advert
(
	advert_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
	publisher varchar(100) NOT NULL,
	display_date date NOT NULL
);

CREATE TABLE IF NOT EXISTS viewing
(
	view_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
	date_viewed date NOT NULL,
	comment varchar(500)
);

CREATE TABLE IF NOT EXISTS registration
(
	reg_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
	reg_date date NOT NULL
);

ALTER TABLE advert 
ADD COLUMN property_id int;

ALTER TABLE advert 
ADD CONSTRAINT FK_property_advert
FOREIGN KEY (property_id) REFERENCES property(property_id);


ALTER TABLE inspection  
ADD COLUMN staff_id int,
ADD COLUMN lease_id int;

ALTER TABLE inspection  
ADD CONSTRAINT FK_staff_inspection
FOREIGN KEY (staff_id) REFERENCES staff(staff_id);

ALTER TABLE inspection
ADD CONSTRAINT FK_lease_inspection
FOREIGN KEY (lease_id) REFERENCES lease(lease_id);


ALTER TABLE lease 
ADD COLUMN property_id int;

ALTER TABLE lease  
ADD CONSTRAINT FK_property_lease
FOREIGN KEY (property_id) REFERENCES property(property_id);


ALTER TABLE property  
ADD COLUMN owner_id int,
ADD COLUMN client_id int,
ADD COLUMN staff_id int,
ADD COLUMN branch_id int;

ALTER TABLE property
ADD CONSTRAINT FK_owner_property
FOREIGN KEY (owner_id) REFERENCES owner(owner_id);

ALTER TABLE property
ADD CONSTRAINT FK_client_property
FOREIGN KEY (client_id) REFERENCES client(client_id);

ALTER TABLE property
ADD CONSTRAINT FK_staff_property
FOREIGN KEY (staff_id) REFERENCES staff(staff_id);

ALTER TABLE property
ADD CONSTRAINT FK_branch_property
FOREIGN KEY (branch_id) REFERENCES branch(branch_id);


ALTER TABLE staff  
ADD COLUMN branch_id int;

ALTER TABLE staff
ADD CONSTRAINT FK_branch_staff
FOREIGN KEY (branch_id) REFERENCES branch(branch_id);


ALTER TABLE viewing  
ADD COLUMN property_id int,
ADD COLUMN client_id int;

ALTER TABLE viewing
ADD CONSTRAINT FK_property_viewing
FOREIGN KEY (property_id) REFERENCES property(property_id);

ALTER TABLE viewing
ADD CONSTRAINT FK_client_viewing
FOREIGN KEY (client_id) REFERENCES client(client_id);


ALTER TABLE registration
ADD COLUMN branch_id int,
ADD COLUMN client_id int;

ALTER TABLE registration
ADD CONSTRAINT FK_branch_registration
FOREIGN KEY (branch_id) REFERENCES branch(branch_id);

ALTER TABLE registration
ADD CONSTRAINT FK_client_registration
FOREIGN KEY (client_id) REFERENCES client(client_id);

