# Company Database SQL Project

## 📌 Project Overview
This project is a Company Database Management System created using SQL using the `TechImpact` database. It demonstrates database creation, table relationships, constraints, data insertion, updates, filtering, joins, aggregate functions, wildcard searches, unions, and subqueries.

## 🛠️ Tools Used
- MySQL
- MySQL Workbench

## 📂 Database Name
```sql
CREATE DATABASE TechImpact;
USE TechImpact;
```

## 🗃️ Tables Created
1. employee  
2. branch  
3. client  
4. works_on  
5. branch_supplier  

## ⚙️ Steps Completed

### Step 1: Database Creation
- Created the `TechImpact` database.
- Selected the database using `USE`.

### Step 2: Table Creation
- Created `employee` table with employee details.
- Created `branch` table with manager details.
- Created `client` table for customers.
- Created `works_on` table for sales records.
- Created `branch_supplier` table for supplier details.

### Step 3: Constraints Applied
- Primary Keys
- Foreign Keys
- `ON DELETE SET NULL`
- `ON DELETE CASCADE`

### Step 4: Inserted Sample Data
- Added employees
- Added branches
- Added clients
- Added suppliers
- Added sales entries

### Step 5: Updated Records
- Updated employee branch IDs
- Updated supervisor IDs
- Updated client names

### Step 6: Data Retrieval Queries
Used:
```sql
SELECT * FROM table_name;
```

### Step 7: Sorting Queries
```sql
ORDER BY salary ASC;
ORDER BY salary DESC;
LIMIT 1;
```

### Step 8: Filtering Queries
```sql
WHERE sex='M';
WHERE birth_day BETWEEN '1970-01-01' AND '1975-01-01';
WHERE first_name IN ('Jim','Michael');
```

### Step 9: Aggregate Functions
```sql
COUNT()
AVG()
SUM()
MAX()
GROUP BY
HAVING
```

### Step 10: Pattern Matching
```sql
LIKE 'LLC%'
LIKE '_____10%'
```

### Step 11: UNION
```sql
SELECT first_name FROM employee
UNION
SELECT branch_name FROM branch;
```

### Step 12: JOINS
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN

### Step 13: Subquery
```sql
SELECT * FROM employee
WHERE emp_id IN (
  SELECT DISTINCT emp_id
  FROM works_on
  WHERE total_sales > 50000
);
```

## 🎯 Learning Outcomes
- Database design
- Table relationships
- SQL constraints
- CRUD basics
- Filtering & sorting
- Joins
- Aggregate functions
- Subqueries

## 🚀 How to Run
1. Open MySQL Workbench  
2. Paste the SQL file  
3. Execute step by step  
4. View outputs  

## 📌 Conclusion
This project is useful for beginners to understand a real-world company database system using SQL.
