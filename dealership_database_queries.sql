use dealership_database;
-- 1. Get all dealerships
select * from dealerships;
-- 2. Find all vehicles for a specific dealership
select dealerships.dealership_id, dealership_name, inventory.vin, make, model from dealerships inner join inventory on dealerships.dealership_id = inventory.dealership_id inner join vehicles on inventory.vin = vehicles.vin where dealerships.dealership_id = (select dealership_id from dealerships where dealership_name like "Elite Motors");
-- 3. Find a car by VIN
select vin, make, model, sold, sale_type from vehicles where vin = 10003;
-- 4. Find the dealership where a certain car is located, by VIN
select dealerships.dealership_id, dealership_name, address, inventory.vin, make, model from dealerships inner join inventory on dealerships.dealership_id = inventory.dealership_id inner join vehicles on inventory.vin = vehicles.vin where inventory.vin = (select vin from vehicles where vin = 10002);
-- 5. Find all Dealerships that have a certain car type (i.e. Red Ford Mustang)
select dealerships.dealership_id, dealership_name, address, inventory.vin, make, model from dealerships inner join inventory on dealerships.dealership_id = inventory.dealership_id inner join vehicles on inventory.vin = vehicles.vin where make = "toyota";
-- 6. Get all sales information for a specific dealer for a specific date range
select dealership_name, address, inventory.vin, make, model, sales_contracts.sale_date as sale_date, sales_contracts.saleid, sales_contracts.customer_first_name, sales_contracts.customer_last_name, sales_contracts.price, sales_contracts.sale_type, lease_contracts.sale_date as lease_date from dealerships join inventory on dealerships.dealership_id = inventory.dealership_id inner join vehicles on inventory.vin = vehicles.vin left join lease_contracts on lease_contracts.vin = inventory.vin left join sales_contracts on sales_contracts.vin = inventory.vin where (dealerships.dealership_id = (select dealership_id from dealerships where dealership_name like "Elite Motors") AND ((sales_contracts.sale_date BETWEEN "2025-01-01" and "2025-07-31") OR (lease_contracts.sale_date BETWEEN "2025-01-01" and "2025-07-31")));
