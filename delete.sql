-- Delete Tables Script

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS advert;
DROP TABLE IF EXISTS branch;
DROP TABLE IF EXISTS client;
DROP TABLE IF EXISTS inspection;
DROP TABLE IF EXISTS lease;
DROP TABLE IF EXISTS owner;
DROP TABLE IF EXISTS property;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS viewing;
DROP TABLE IF EXISTS registration;
DROP TABLE IF EXISTS lease_customer;

SET FOREIGN_KEY_CHECKS = 1;

DROP ROLE IF EXISTS admin_user, agent_user, accounts_user, manager_user;