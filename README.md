# 2016_database
2016, Database, Industry Engineering, Pusan National University

## Table of Contents

- [0. Install](#install)
- [1. Introduction](#introduction)
- [2. SQL](#SQL)

## Install
Please, sign up http://dev.mysql.com/downloads/ and install MySQL Community Server(5.7 or higher) and MySQL Workbench (6.3 or higher) on your computer.

Reference: Please follow the instructions in http://dev.mysql.com/doc/refman/5.7/en/mysql-installer-gui.html.

## Introduction

- Open MySQL Workbench and connect MySQL server.
- Run "CH01-CLASS-GRADE-STUDENT" script.
- Enjoy your fisrt RDB world, probably!

### ER Diagram

<img src="/lecture/image/CH01-CLASS-STUDENT-GRADE.png" width="49%">

## SQL

Please visit [KHAN ACADEMY "Intro to SQL"](https://www.khanacademy.org/computing/computer-programming/sql) website and watch "SQL Basics" section (it takes 15 minutes less).

Please follow the instructions below for next class:

  First, read the ER Diagram and all examples of a SQL SELECT statement.
  
  Second, visit [KHAN ACEDEMY "SQL Script"](https://www.khanacademy.org/computer-programming/new/sql) website and practice SELECT statements. 
  
  Final, enjoy, SQL World! Hope [this script](/lecture/ch02_material/CH02-KHAN-ACADEMY.sql) helps. 

### ER Diagram

<img src="/lecture/image/CH02-ITEM-RETAIL-SKU.png" width="49%">

### Reading Specified Columns
Suppose we want to extract data of columns from our own table. An SQL statement to extract the data is the following:
```sql
SELECT [YOUR_OWN_COLUMN_NAME1], [YOUR_OWN_COLUMN_NAME2] ...
FROM [YOUR_OWN_TABLE_NAME];
```
#### Examples
```sql
SELECT Department, Buyer 
FROM SKU_DATA;
```

### Specifying Column Order
How to switch COLUMN_NAME1 and COLUMN_NAME2
```sql
SELECT [YOUR_OWN_COLUMN_NAME2], [YOUR_OWN_COLUMN_NAME1] ...
FROM [YOUR_OWN_TABLE_NAME];
```
#### Examples
```sql
SELECT Buyer, Department 
FROM SKU_DATA;
```

How to extract all of the columns from our own table
```sql
SELECT *
FROM [YOUR_OWN_TABLE_NAME];
```
#### Examples
```sql
SELECT *
FROM SKU_DATA;
```

### Reading Specified Rows
Suppose we want any, some, or all of the columns of our own table, but we want only the rows for some conditions.
```sql
SELECT [YOUR_OWN_COLUMN_NAME1], [YOUR_OWN_COLUMN_NAME2] ...
FROM [YOUR_OWN_TABLE_NAME]
WHERE [SOME CONDITIONS];
```
#### Examples
```sql
SELECT *
FROM SKU_DATA
WHERE Department='Water Sports';

SELECT *
FROM SKU_DATA
WHERE SKU > 200000;

SELECT SKU_Description, Department
FROM SKU_DATA
WHERE Department='Climbing';

SELECT SKU_Description, Buyer
FROM SKU_DATA
WHERE Department='Climbing';
```

### WHERE Clause Options
SQL includes a number of SQL WHERE clause options such as compound clauses, ranges, and wildcards.
```
SELECT *
FROM [YOUR_OWN_TABLE_NAME]
WHERE [clause options];
```
#### Examples
```sql
SELECT *
FROM SKU_DATA
WHERE Department='Water Sports'
AND Buyer='Nancy Meyers';

SELECT *
FROM SKU_DATA
WHERE Department='Camping'OR
Department='Climbing';

SELECT *
FROM SKU_DATA
WHERE Buyer IN ('Nancy Meyers', 'Cindy Lo', 'Jerry Martin');

SELECT *
FROM SKU_DATA
WHERE Buyer NOT IN ('Nancy Meyers', 'Cindy Lo', 'Jerry Martin');

SELECT *
FROM ORDER_ITEM
WHERE ExtendedPrice >= 100 AND
ExtendedPrice <= 200;

SELECT *
FROM ORDER_ITEM
WHERE ExtendedPrice BETWEEN 100 AND 200;

SELECT *
FROM SKU_DATA
WHERE Buyer LIKE 'Pete%';

SELECT *
FROM SKU_DATA
WHERE SKU_Description LIKE '%Tent%';
```

### Sorting the SQL Query Results
Suppose we want the DBMS to display the rows in a particular order.
```
SELECT *
FROM [YOUR_OWN_TABLE_NAME]
WHERE [SOME CONDITIONS]
ORDER BY [SOME COLUMNS];
```
#### Examples
```sql
SELECT *
FROM ORDER_ITEM
ORDER BY OrderNumber;

SELECT *
FROM ORDER_ITEM
ORDER BY OrderNumber, Price;

SELECT *
FROM ORDER_ITEM
ORDER BY Price DESC, OrderNumber ASC;
```

Tips : Please, practice your sql skills on https://www.hackerrank.com/domains/sql.
