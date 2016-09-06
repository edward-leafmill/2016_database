-- Reading Specified Columns from a Single Table
/* *** SQL-Query-CH02-01 *** */ 
SELECT Department, Buyer 
FROM SKU_DATA;

-- Specifying Column Order in SQL Queries from a Single Table
/* *** SQL-Query-CH02-02 *** */ 
SELECT Buyer, Department 
FROM SKU_DATA;

/* *** SQL-Query-CH02-03 *** */ 
SELECT DISTINCT Buyer, Department 
FROM SKU_DATA;

/* *** SQL-Query-CH02-04 *** */
SELECT SKU, SKU_Description, Department, Buyer 
FROM SKU_DATA;

/* *** SQL-Query-CH02-05 *** */ 
SELECT *
FROM SKU_DATA;

-- Reading Specified Rows from a Single Table
/* *** SQL-Query-CH02-06 *** */
SELECT *
FROM SKU_DATA
WHERE Department='Water Sports';

/* *** SQL-Query-CH02-07 *** */
SELECT *
FROM SKU_DATA
WHERE SKU > 200000;

-- Reading Specified Columns and Rows from a Single Table
/* *** SQL-Query-CH02-08 *** */
SELECT SKU_Description, Department
FROM SKU_DATA
WHERE Department='Climbing';

/* *** SQL-Query-CH02-09 *** */
SELECT SKU_Description, Buyer
FROM SKU_DATA
WHERE Department='Climbing';

-- Sorting the SQL Query Results
/* *** SQL-Query-CH02-10 *** */
SELECT *
FROM ORDER_ITEM
ORDER BY OrderNumber;

/* *** SQL-Query-CH02-11 *** */
SELECT *
FROM ORDER_ITEM
ORDER BY OrderNumber, Price;

/* *** SQL-Query-CH02-12 *** */
SELECT *
FROM ORDER_ITEM
ORDER BY Price, OrderNumber;

/* *** SQL-Query-CH02-13 *** */
SELECT *
FROM ORDER_ITEM
ORDER BY Price DESC, OrderNumber ASC;

/* *** SQL-Query-CH02-14 *** */
SELECT *
FROM ORDER_ITEM
ORDER BY Price DESC, OrderNumber;

-- SQL WheRe Clause Options
/* *** SQL-Query-CH02-15 *** */
SELECT *
FROM SKU_DATA
WHERE Department='Water Sports'
AND Buyer='Nancy Meyers';

/* *** SQL-Query-CH02-16 *** */
SELECT *
FROM SKU_DATA
WHERE Department='Camping'OR
Department='Climbing';

/* *** SQL-Query-CH02-17 *** */
SELECT *
FROM SKU_DATA
WHERE Buyer IN ('Nancy Meyers', 'Cindy Lo', 'Jerry Martin');

/* *** SQL-Query-CH02-18 *** */
SELECT *
FROM SKU_DATA
WHERE Buyer NOT IN ('Nancy Meyers', 'Cindy Lo', 'Jerry Martin');


/* *** SQL-Query-CH02-19 *** */
SELECT *
FROM ORDER_ITEM
WHERE ExtendedPrice BETWEEN 100 AND 200;

/* *** SQL-Query-CH02-20 *** */
SELECT *
FROM ORDER_ITEM
WHERE ExtendedPrice >= 100 AND
ExtendedPrice <= 200;

/* *** SQL-Query-CH02-21 *** */
SELECT *
FROM SKU_DATA
WHERE Buyer LIKE 'Pete%';

/* *** SQL-Query-CH02-22 *** */
SELECT *
FROM SKU_DATA
WHERE SKU_Description LIKE '%Tent%';

/* *** SQL-Query-CH02-23 *** */
SELECT *
FROM SKU_DATA
WHERE SKU LIKE '%2%';

/* *** SQL-Query-CH02-24 *** */
SELECT *
FROM SKU_DATA
WHERE SKU LIKE '%2__';

-- Combing the SQL WheRe Clause and the SQL ORDeR By Clause
/* *** SQL-Query-CH02-25 *** */
SELECT * 
FROM ORDER_ITEM
WHERE ExtendedPrice BETWEEN 100 AND 200
ORDER BY OrderNumber DESC;


