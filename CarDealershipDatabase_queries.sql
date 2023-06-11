USE cardealership;

/**********************
1. Get all dealerships
**********************/

SELECT *
FROM dealerships;

/**********************************************
2. Find all vehicles for a specific dealership
**********************************************/

SELECT v.*
FROM vehicles AS v
INNER JOIN inventory AS i
ON v.VIN = i.VIN
WHERE i.dealership_id = 2;

/********************
3. Find a car by VIN
********************/

SELECT *
FROM vehicles
WHERE VIN = '7LMFU28575LJ12382';

/*************************************************************
4. Find the dealership where a certain car is located, by VIN
*************************************************************/

SELECT d.*
FROM dealerships AS d
INNER JOIN inventory AS i 
ON d.dealership_id = i.dealership_id
WHERE i.VIN = '7LMFU28575LJ12382';

/****************************************************
5. Find all Dealerships that have a certain car type
****************************************************/

SELECT d.*
FROM dealerships AS d
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
FROM sales_contracts AS s
INNER JOIN vehicles AS v 
ON s.VIN = v.VIN
INNER JOIN inventory AS i 
ON v.VIN = i.VIN
INNER JOIN dealerships AS d 
ON i.dealership_id = d.dealership_id
WHERE d.dealership_id = 2
  AND s.sale_date >= '2023-05-01'
  AND s.sale_date <= '2023-07-01';
 
 /*******************************************************************
7. Interesting: List all car that already sold with their dealership
********************************************************************/
 
SELECT v.*
	, d.*
FROM vehicles AS v
INNER JOIN inventory AS i
ON v.VIN = i.VIN
INNER JOIN dealerships AS d
ON i.dealership_id = d.dealership_id
WHERE v.sold = 1; 