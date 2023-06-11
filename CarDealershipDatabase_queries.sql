USE cardealership;

/**********************
1. Get all dealerships
**********************/

select *
from dealerships;

/**********************************************
2. Find all vehicles for a specific dealership
**********************************************/

select v.*
from vehicles as v
inner join inventory as i
on v.VIN = i.VIN
where i.dealership_id = 2;

/********************
3. Find a car by VIN
********************/

select *
from vehicles
where VIN = '7LMFU28575LJ12382';

/*************************************************************
4. Find the dealership where a certain car is located, by VIN
*************************************************************/

SELECT d.*
FROM dealerships d
INNER JOIN inventory AS i 
ON d.dealership_id = i.dealership_id
WHERE i.VIN = '7LMFU28575LJ12382';

/****************************************************
5. Find all Dealerships that have a certain car type
****************************************************/

SELECT d.*
FROM dealerships d
INNER JOIN inventory AS i 
ON d.dealership_id = i.dealership_id
INNER JOIN vehicles AS v 
ON i.VIN = v.VIN
WHERE v.vehicle_make = 'Honda'
  AND v.vehicle_model = 'Accord';

/****************************************************************************
6. Get all sales information for a specific dealer for a specific date range
****************************************************************************/

SELECT s.*
FROM sales_contracts s
INNER JOIN vehicles AS v 
ON s.VIN = v.VIN
INNER JOIN inventory AS i 
ON v.VIN = i.VIN
INNER JOIN dealerships AS d 
ON i.dealership_id = d.dealership_id
WHERE d.dealership_id = 2
  AND s.sale_date >= '2023-05-01'
  AND s.sale_date <= '2023-07-01';