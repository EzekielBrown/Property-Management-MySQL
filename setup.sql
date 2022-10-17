CREATE TABLE IF NOT EXISTS staff
(
	staff_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	email varchar(50) NOT NULL,
	phone varchar(12) NOT NULL,
	street varchar(50) NOT NULL,
	city varchar(50) NOT NULL,
	postal_code varchar(4) NOT NULL
);

CREATE TABLE IF NOT EXISTS inspection
(
	inspection_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
	inspection_date date NOT NULL,
	pass bit NOT NULL,
	comment varchar(255)
);

CREATE TABLE IF NOT EXISTS lease
(
	lease_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
	rent_price decimal(19,0) NOT NULL,
	rent_period varchar(11) NOT NULL,
	bond_price decimal(19,0) NOT NULL,
	bond_paid bit NOT NULL,
	start_date date NOT NULL,
	end_date date NOT NULL
);

CREATE TABLE IF NOT EXISTS client
(
	client_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	email varchar(50) NOT NULL,
	phone varchar(12) NOT NULL
);

CREATE TABLE IF NOT EXISTS job_title
(
	job_id int PRIMARY KEY NOT NULL,
	job_title varchar(30)
);

CREATE TABLE IF NOT EXISTS branch
(
	branch_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
	name varchar(50) NOT NULL,
	street varchar(50) NOT NULL,
	city varchar(50) NOT NULL,
	postal_code varchar(4) NOT NULL
);

CREATE TABLE IF NOT EXISTS owner
(
	owner_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	email varchar(50) NOT NULL,
	phone varchar(12) NOT NULL,
	street varchar(50) NOT NULL,
	city varchar(50) NOT NULL,
	postal_code varchar(4) NOT NULL
);

CREATE TABLE IF NOT EXISTS property
(
	property_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
	street varchar(50) NOT NULL,
	city varchar(50) NOT NULL,
	postal_code varchar(4) NOT NULL
);

CREATE TABLE IF NOT EXISTS advertisement
(
	advertisement_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
	start_date date NOT NULL,
	end_date date NOT NULL
);

CREATE TABLE IF NOT EXISTS viewing
(
	view_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
	date_viewed date NOT NULL
);

CREATE TABLE IF NOT EXISTS history
(
	history_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
	start_date date NOT NULL,
	end_date date NOT NULL,
	damages decimal(19,0) NOT NULL
);



ALTER TABLE advertisement 
ADD COLUMN property_id int;

ALTER TABLE advertisement 
ADD CONSTRAINT FK_property_advertisement
FOREIGN KEY (property_id) REFERENCES property(property_id);


ALTER TABLE client 
ADD COLUMN property_id int;

ALTER TABLE client
ADD CONSTRAINT FK_property_client
FOREIGN KEY (property_id) REFERENCES property(property_id);


ALTER TABLE history  
ADD COLUMN property_id int;

ALTER TABLE history  
ADD CONSTRAINT FK_property_history
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
ADD COLUMN client_id int;

ALTER TABLE lease  
ADD CONSTRAINT FK_client_lease
FOREIGN KEY (client_id) REFERENCES client(client_id);


ALTER TABLE property  
ADD COLUMN owner_id int,
ADD COLUMN client_id int;

ALTER TABLE property
ADD CONSTRAINT FK_owner_property
FOREIGN KEY (owner_id) REFERENCES owner(owner_id);

ALTER TABLE property
ADD CONSTRAINT FK_client_property
FOREIGN KEY (client_id) REFERENCES client(client_id);


ALTER TABLE staff  
ADD COLUMN branch_id int,
ADD COLUMN job_id int;

ALTER TABLE staff
ADD CONSTRAINT FK_branch_staff
FOREIGN KEY (branch_id) REFERENCES branch(branch_id);

ALTER TABLE staff
ADD CONSTRAINT FK_title_staff
FOREIGN KEY (job_id) REFERENCES job_title(job_id);


ALTER TABLE viewing  
ADD COLUMN property_id int,
ADD COLUMN client_id int;

ALTER TABLE viewing
ADD CONSTRAINT FK_property_viewing
FOREIGN KEY (property_id) REFERENCES property(property_id);

ALTER TABLE viewing
ADD CONSTRAINT FK_client_viewing
FOREIGN KEY (client_id) REFERENCES client(client_id);

