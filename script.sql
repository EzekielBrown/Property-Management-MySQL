
-- A list of all properties, including the property address, owner and agent responsible for each property ordered alphabetically by city.
SELECT p.property_id, p.address, p.city, concat(o.first_name," ", o.last_name), concat(s.first_name," ", s.last_name)
FROM property p
JOIN owner o ON p.owner_id = o.owner_id 
JOIN staff s ON p.staff_id = s.staff_id 
GROUP BY property_id
ORDER BY city, address ASC;


--  A list of the properties available to rent or lease, including the property lease/rent amount and period, the property address and agents responsible for each property ordered low to high by rental/lease price.
SELECT p.property_id, p.address, l.rent_amount, l.rent_period, concat(s.first_name," ", s.last_name)
FROM property p
JOIN lease l ON p.property_id = l.property_id
JOIN staff s ON p.staff_id = s.staff_id
GROUP BY property_id
ORDER BY l.rent_amount

-- A list of staff including their name, phone, email, position (i.e. agent, accounts etc..) and their manager filtered by branch ordered alphabetically by the agent's name.
SELECT concat(s.first_name," ", s.last_name), s.phone, s.phone, s.staff_position, b.name
FROM staff s
JOIN branch b ON s.branch_id = b.branch_id
GROUP BY s.branch_id  
ORDER BY concat(s.first_name," ", s.last_name)


-- A list of current owners and tenants, including their contact details and a field indicating if they are an owner, or tenant ordered alphabetically by name.

-- A list of clients that have viewed properties in the last four weeks, including the client's name, contact details and the number of properties they have visited, filtered by the branch they are registered with ordered high to low by the visits.

-- A list of upcoming adverts placed, including the property, date and the publication where the advert has been placed ordered by date showing the newest first.

-- A query to update all properties managed by an agent to another agent.

-- A query to delete all the client property viewings older than 12 months.

-- A query to delete all properties for a specific owner.

-- Write your own query relevant to the scenario and include a written description of what the query is aiming to do.