SELECT * FROM startups;

-- Counting how many startups are in the database --
SELECT COUNT(name)
FROM startups;

-- Calculation the total valuation from all startups --
SELECT SUM(valuation)
FROM startups;

-- MAX amount raised by startups (problem here with max raised = $1.15b) --
SELECT MAX(raised)
FROM startups;

-- MAX amount raised for Seed stage startup (problem here with max raised = $1.80m) --
SELECT MAX(raised)
FROM startups
WHERE stage = "Seed";

-- Finding the olders startup in the list --
SELECT MIN(founded)
FROM startups;

-- Average valuation of all startups (this worked for some reason - problem in max is not due to amount of digits in valuation?) --
SELECT AVG(valuation)
FROM startups;

-- Average valuation in each category (some values are not correct as per Codecademy)--
SELECT category, AVG(valuation)
FROM startups
GROUP BY category
ORDER BY category ASC;

-- Average valuation in each category rounded to 2 d.p --
SELECT category, ROUND(AVG(valuation),2)
FROM startups
GROUP BY category
ORDER BY category ASC;

-- Average valuation in each category rounded to 2 d.p and arranged from highest valuation to lowest (didn't work here for some reason but does on Codecademy) --
SELECT category, ROUND(AVG(valuation),2) AS "Average Valuation"
FROM startups
GROUP BY category
ORDER BY "Average Valuation" DESC;

-- Find the most competitive market --
SELECT category, COUNT(name) AS "Number of Startups"
FROM startups
GROUP BY category
ORDER BY "Number of Startups" DESC;

-- Find most competitive markets with more than 3 startups (working on Codecademy but no here)--
SELECT category, COUNT(name) AS "Number of Startups"
FROM startups
GROUP BY category
HAVING "Number of Startups" > 3
ORDER BY "Number of Startups" DESC;

-- Average size of a startup in each location --
SELECT location, ROUND(AVG(employees),0)
FROM startups
GROUP BY location;

-- Average size of a startup in each location having more than 500 employees (Working on Codecademy but not here)--
SELECT location, ROUND(AVG(employees),0) AS "Average Size"
FROM startups
GROUP BY location
HAVING "Average Size" > 500;