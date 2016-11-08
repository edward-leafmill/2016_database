# 2016_database
Fall Semester 2016, Database, Industry Engineering, Pusan National University

## Table of Contents

- [0. Install](#install)
- [1. Introduction](#introduction)
- [2. SQL](#sql)
- [3. SQL Part2](#sql-part2)
- [4. Relational Model](#relational-model)
  - [Team 1](#team-1) [Team 2](#team-2) [Team 3](#team-3) [Team 4](#team-4) [Team 5](#team-5)
  - [Team 6](#team-6) [Team 7](#team-7) [Team 8](#team-8) [Team 9](#team-9) [Team 10](#team-10)
  - [Team 11](#team-11) [Team 12](#team-12) [Team 13](#team-13)
- [5. ER Model] (#er-model)

## Install
Please, sign up http://dev.mysql.com/downloads/ and install MySQL Community Server(5.7 or higher) and MySQL Workbench (6.3 or higher) on your computer.

Reference: Please follow the instructions in http://dev.mysql.com/doc/refman/5.7/en/mysql-installer-gui.html.

## Introduction

- Open MySQL Workbench and connect MySQL server.
- Run "CH01-CLASS-GRADE-STUDENT" script.
- Enjoy your first RDB world, probably!

### ER Diagram

<img src="/lecture/image/CH01-CLASS-STUDENT-GRADE.png" width="49%">

## SQL

Please visit [KHAN ACADEMY "Intro to SQL"](https://www.khanacademy.org/computing/computer-programming/sql) website and watch "SQL Basics" section (it takes 15 minutes less).

Please follow the instructions below for next class:

  First, read the ER Diagram and all examples of a SQL SELECT statement.
  
  Second, visit [KHAN ACEDEMY "SQL Script"](https://www.khanacademy.org/computer-programming/new/sql) website and practice SELECT statements. 
  
  Third, enjoy, SQL World! Hope [this script](/lecture/ch02_material/CH02-KHAN-ACADEMY.sql) helps. 

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

## SQL Part2

Please visit [KHAN ACADEMY "Intro to SQL"](https://www.khanacademy.org/computing/computer-programming/sql) website and watch "More advanced SQL queries" and "Relational queries in SQL" section.

### Notice

2016 SQL League is  the extreme competition for student teams in Database class. The rule is simple, given the problems, each team tries to solve all the problems as soon as possible and submit answers to the instructor via email. Half of them who first reache instructor's inbox are the winners. The winners will receive some points as compensation.

### Performing Calculations in SQL Queries
There are five SQL built-in functions for performing arithmetic on columns in a given table: SUM, AVG, MIN, MAX, and COUNT.

```sql
SELECT [Built-In Function] ( [YOUR_OWN_COLUMN_NAME1] ) ...
FROM [YOUR_OWN_TABLE_NAME];
```
#### Examples
```sql
SELECT SUM(ExtendedPrice) AS OrderItemSum,
       AVG(ExtendedPrice) AS OrderItemAvg,
       MIN(ExtendedPrice) AS OrderItemMin,
       MAX(ExtendedPrice) AS OrderItemMax
FROM ORDER_ITEM;

SELECT COUNT(*) AS NumberOfRows 
FROM ORDER_ITEM;
```

### Two limitations to SQL built-in functions. 
- First, except for grouping (USING GROUP BY), you cannot combine a table column name with an SQL built-in function.
- Second, you cannot use them in an SQL WHERE clause.

#### Examples
```sql
SELECT Department, COUNT(*)
FROM SKU_DATA;

SELECT *
FROM RETAIL_ORDER
WHERE OrderTotal > AVG(OrderTotal);
```

### SQL expressions in SQL SELECT Statements
```sql
SELECT Quantity * Price AS EP 
FROM ORDER_ITEM;

SELECT CONCAT (Buyer, ' in ', Department) AS Sponsor 
FROM SKU_DATA;
```

### Grouping in SQL SeLeCT Statements
In SQL queries, rows can be grouped according to common values using the SQL GROUP BY clause. SQL provides one more GROUP BY clause feature that the SQL HAVING clause restricts the groups that are presented in the result.

```sql
SELECT [YOUR_OWN_COLUMN_NAME1], [YOUR_OWN_COLUMN_NAME2], ..., [Built-In Function] ( [YOUR_OWN_COLUMN_NAME1] )
FROM [YOUR_OWN_TABLE_NAME]
GROUP BY [YOUR_OWN_COLUMN_NAME1], [YOUR_OWN_COLUMN_NAME2], ...;

SELECT Department, COUNT(*) AS Dept_SKU_Count
FROM SKU_DATA
GROUP BY Department;

SELECT Department, COUNT(*) AS Dept_SKU_Count 
FROM SKU_DATA
GROUP BY Department
HAVING COUNT(*) > 1;
```

### Querying Two or More Tables with SQL
The SQL join operator is used to combine two or more tables by concatenating the rows of one table with the rows of another table.

```sql
SELECT *
FROM [YOUR_OWN_TABLE_NAME1], [YOUR_OWN_TABLE_NAME2]
WHERE [YOUR_OWN_TABLE_NAME1].[YOUR_OWN_COLUMN_NAME1] = [YOUR_OWN_TABLE_NAME2].[YOUR_OWN_COLUMN_NAME2];
```

#### Examples
```sql
SELECT *
FROM RETAIL_ORDER, ORDER_ITEM
WHERE RETAIL_ORDER.OrderNumber=ORDER_ITEM.OrderNumber;
```

### The SQL JOIN ON Syntax

- INNER JOIN
  When the tables are joined using an equal condition, this join is called an equijoin. This type of join is also referred to as an inner join.
```sql
SELECT *
FROM [YOUR_OWN_TABLE_NAME1] INNER JOIN [YOUR_OWN_TABLE_NAME2]
     ON [YOUR_OWN_TABLE_NAME1].[YOUR_OWN_COLUMN_NAME1] = [YOUR_OWN_TABLE_NAME2].[YOUR_OWN_COLUMN_NAME2];
```

#### Examples
```sql
SELECT *
FROM RETAIL_ORDER INNER JOIN ORDER_ITEM
     ON RETAIL_ORDER.OrderNumber=ORDER_ITEM.OrderNumber;
```

- OUTER JOIN
  because the table we want is listed first in the query and is thus on the left side of the table listing, we specifically use an SQL left outer join, which uses the SQL LEFT JOIN syntax.
```sql
SELECT *
FROM [YOUR_OWN_TABLE_NAME1] {LEFT|RIGHT} OUTER JOIN [YOUR_OWN_TABLE_NAME2]
WHERE [YOUR_OWN_TABLE_NAME1].[YOUR_OWN_COLUMN_NAME1] = [YOUR_OWN_TABLE_NAME2].[YOUR_OWN_COLUMN_NAME2];
```

#### Examples
```sql
SELECT *
FROM ORDER_ITEM RIGHT OUTER JOIN SKU_DATA
     ON ORDER_ITEM.SKU=SKU_DATA.SKU;
```


## Relational Model

### Team 1

![1 team](/term/the first material/1.png)

### Team 2

![2 team](/term/the first material/2.png)

### Team 3

![3 team](/term/the first material/3.png)

### Team 4

![4 team](/term/the first material/4.png)

### Team 5

![5 team](/term/the first material/5.png)

### Team 6

![6 team](/term/the first material/6.png)

### Team 7

![7 team](/term/the first material/7.png)

### Team 8

![8 team](/term/the first material/8.png)

### Team 9

![9 team](/term/the first material/9.png)

### Team 10

![10 team](/term/the first material/10.png)

### Team 11

![11 team](/term/the first material/11.png)

### Team 12

![12 team](/term/the first material/12.png)

### Team 13

![13 team](/term/the first material/13.png)

# ER Model

![1:N relationship](/lecture/image/CH05-1_N_ER_DIAGRAM.001.jpeg)
