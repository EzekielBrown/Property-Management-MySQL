ALTER TABLE advertisement
DROP FOREIGN KEY FK_property_advertisement;


ALTER TABLE client
DROP FOREIGN KEY FK_property_client;

ALTER TABLE history
DROP FOREIGN KEY FK_property_history;


ALTER TABLE inspection
DROP FOREIGN KEY FK_lease_inspection,
DROP FOREIGN KEY FK_staff_inspection;

ALTER TABLE lease
DROP FOREIGN KEY FK_client_lease;

ALTER TABLE property
DROP FOREIGN KEY FK_client_property,
DROP FOREIGN KEY FK_owner_property;

ALTER TABLE staff
DROP FOREIGN KEY FK_branch_staff,
DROP FOREIGN KEY FK_title_staff;


ALTER TABLE viewing
DROP FOREIGN KEY FK_client_viewing,
DROP FOREIGN KEY FK_property_viewing;


DROP TABLE advertisement;
DROP TABLE branch;
DROP TABLE client;
DROP TABLE history;
DROP TABLE inspection;
DROP TABLE job_title;
DROP TABLE lease;
DROP TABLE owner;
DROP TABLE property;
DROP TABLE staff;
DROP TABLE viewing;
