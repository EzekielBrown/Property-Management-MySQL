ALTER TABLE advert
DROP FOREIGN KEY FK_property_advert;

ALTER TABLE inspection
DROP FOREIGN KEY FK_lease_inspection,
DROP FOREIGN KEY FK_staff_inspection;

ALTER TABLE lease
DROP FOREIGN KEY FK_property_lease;

ALTER TABLE property
DROP FOREIGN KEY FK_branch_property,
DROP FOREIGN KEY FK_owner_property,
DROP FOREIGN KEY FK_staff_property,
DROP FOREIGN KEY FK_client_property;

ALTER TABLE staff
DROP FOREIGN KEY FK_branch_staff;


ALTER TABLE viewing
DROP FOREIGN KEY FK_client_viewing,
DROP FOREIGN KEY FK_property_viewing;

ALTER TABLE registration
DROP FOREIGN KEY FK_client_registration,
DROP FOREIGN KEY FK_branch_registration;



DROP TABLE advert;
DROP TABLE branch;
DROP TABLE client;
DROP TABLE inspection;
DROP TABLE lease;
DROP TABLE owner;
DROP TABLE property;
DROP TABLE staff;
DROP TABLE viewing;
DROP TABLE registration;

