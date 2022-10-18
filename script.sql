
-- A list of all properties, including the property address, owner and agent responsible for each property ordered alphabetically by city.
SELECT property.property_id, property.address, property.city, concat(owner.first_name," ", owner.last_name), concat(staff.first_name," ", staff.last_name)
FROM property 
JOIN owner ON property.owner_id = owner.owner_id 
JOIN staff ON property.staff_id = staff.staff_id 
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

-- A list of current owners and tenants, including their contact details and a field indicating if they are an owner, or tenant ordered alphabetically by name.

-- A list of clients that have viewed properties in the last four weeks, including the client's name, contact details and the number of properties they have visited, filtered by the branch they are registered with ordered high to low by the visits.

-- A list of upcoming adverts placed, including the property, date and the publication where the advert has been placed ordered by date showing the newest first.

-- A query to update all properties managed by an agent to another agent.

-- A query to delete all the client property viewings older than 12 months.

-- A query to delete all properties for a specific owner.

-- Write your own query relevant to the scenario and include a written description of what the query is aiming to do.