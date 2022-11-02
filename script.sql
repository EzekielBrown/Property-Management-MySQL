
-- Q1. A list of all properties, including the property address, owner and agent responsible for each property ordered alphabetically by city.

SELECT p.property_id, p.address, p.city, concat(o.first_name," ", o.last_name) AS "owners name", concat(s.first_name," ", s.last_name) AS "agent name"
FROM property p
JOIN owner o ON p.owner_id = o.owner_id 
JOIN staff s ON p.staff_id = s.staff_id 
GROUP BY property_id
ORDER BY city, address ASC;


-- Q2. A list of the properties available to rent or lease, including the property lease/rent amount and period, the property address and agents responsible for each property ordered low to high by rental/lease price.

SELECT p.property_id, p.address, l.rent_amount, l.rent_period, s.staff_id, concat(s.first_name," ", s.last_name) AS "agents name"
FROM property p
JOIN lease l ON p.property_id = l.property_id
JOIN staff s ON p.staff_id = s.staff_id
GROUP BY property_id
ORDER BY l.rent_amount


-- Q3. A list of staff including their name, phone, email, position (i.e. agent, accounts etc..) and their manager filtered by branch ordered alphabetically by the agent's name.

SELECT concat(s.first_name," ", s.last_name) as "staffs name", s.phone, s.phone, s.staff_position, s.manager_id, b.name
FROM staff s
JOIN branch b ON s.branch_id = b.branch_id
GROUP BY s.staff_id  
ORDER BY concat(s.first_name," ", s.last_name)


-- Q4. A list of current owners and tenants, including their contact details and a field indicating if they are an owner, or tenant ordered alphabetically by name.

SELECT 'Owner' AS owner_id, concat(o.first_name, " ", o.last_name) AS Name, phone, email
FROM owner o
UNION
SELECT 'Tenant' AS client_id, concat(c.first_name, " ", c.last_name) AS Name, phone, email
FROM client c
ORDER BY Name


-- Q5. A list of clients that have viewed properties in the last four weeks, including the client's name, contact details and the number of properties they have visited, filtered by the branch they are registered with ordered high to low by the visits.
#

SELECT COUNT(v.client_id) AS "Num of Viewers",v.date_viewed, concat(c.first_name," ", c.last_name), c.phone, c.email, r.branch_id 
FROM viewing v
LEFT JOIN client c ON v.client_id = c.client_id
LEFT JOIN registration r ON c.client_id = r.client_id
WHERE v.date_viewed BETWEEN '2022-09-23' AND '2022-10-23'
GROUP BY v.client_id
ORDER BY "Num of Viewers" DESC;


-- Q6. A list of upcoming adverts placed, including the property, date and the publication where the advert has been placed ordered by date showing the newest first.

SELECT a.advert_id, p.address , a.display_date, a.publisher 
FROM advert a
JOIN property p ON a.property_id = p.property_id
GROUP BY p.property_id 
ORDER BY a.display_date DESC;

-- Q7. A query to update all properties managed by an agent to another agent.

SELECT COUNT(staff_id)
FROM property
WHERE staff_id = 5;

UPDATE property
SET property.staff_id = 10
WHERE property.staff_id = 5;

SELECT COUNT(staff_id)
FROM property
WHERE staff_id = 5;


-- Q8. A query to delete all the client property viewings older than 12 months.

SELECT *
FROM viewing
WHERE date_viewed < '2021-10-23'

DELETE FROM viewing
WHERE date_viewed < '2021-10-23'

SELECT *
FROM viewing
WHERE date_viewed < '2021-10-23'


-- Q9. A query to delete all properties for a specific owner.

SELECT property_id
FROM property 
WHERE owner_id = 10

SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM property
WHERE owner_id = 10;

SET FOREIGN_KEY_CHECKS = 1;


-- Q10. Write your own query relevant to the scenario and include a written description of what the query is aiming to do.
-- Create a query to display clients first name, last name, address, city and zip code. Only showing clients with the zipcode between 9000 and 9999, ordered by lowest to highest

SELECT concat(c.first_name," ", c.last_name) AS Name, c.address, c.city, c.postal_code  
FROM client c
WHERE postal_code >= 9000 AND postal_code <=9999
ORDER BY postal_code ASC;