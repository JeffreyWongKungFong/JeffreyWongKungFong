/* CHECKING ALL TABLES AND SEEING CONTENT */

USE lyft;

SELECT * FROM trips;

SELECT * FROM riders;

SELECT * FROM riders2;

SELECT * FROM cars;

-- TRYING CROSS JOIN TO SEE ALL COMBINATIONS OF RIDERS AND CARS AVAILABLE

SELECT *
FROM cars
CROSS JOIN riders;

-- Trip Logs --

SELECT *
FROM trips

LEFT JOIN riders
ON riders.id = trips.rider_id;

-- LINKING TRIPS AND CAR USED --

SELECT *
FROM trips

INNER JOIN cars
ON trips.car_id = cars.id;

-- ADDING NEW RIDER DATA TO CURRENT ONE --

SELECT * FROM riders

UNION

SELECT * FROM riders2;

-- AVERAGE COST OF TRIPS --

SELECT AVG (cost)
FROM trips;

-- EMAIL CAMPAIGN FOR IRREGULAR USERS (USING APP < 500 TIMES) --
WITH riders_total 
AS 
(SELECT * FROM riders
UNION
SELECT * FROM riders2)

SELECT riders_total.id, riders_total.first, riders_total.last, riders_total.username, riders_total.total_trips
FROM riders_total
WHERE total_trips < 500;

-- NUMBER OF ACTIVE CAR --
SELECT COUNT(*)
FROM cars
WHERE status = "active";

-- SAFETY RECALL TIME - FIND 2 CARS WITH MOST TRIPS COMPLETED --
SELECT *
FROM cars
ORDER BY trips_completed DESC
LIMIT 2;