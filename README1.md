# 📊 Company Database Management System (TechImpact)

## 📌 Overview

This project contains SQL queries to design and manage a **Company
Database System** called **TechImpact**.\
It models employees, branches, clients, and suppliers with real-world
relationships.

------------------------------------------------------------------------

## 🏗️ Database Structure

### 1. Employee

-   emp_id (PK)
-   first_name
-   last_name
-   birth_day
-   sex
-   salary
-   super_id (FK → employee.emp_id)
-   branch_id (FK → branch.branch_id)

### 2. Branch

-   branch_id (PK)
-   branch_name
-   mgr_id (FK → employee.emp_id)
-   mgr_start_date

### 3. Client

-   client_id (PK)
-   client_name
-   branch_id (FK → branch.branch_id)

### 4. Works_With

-   emp_id (FK)
-   client_id (FK)
-   total_sales\
    **PK:** (emp_id, client_id)

### 5. Branch_Supplier

-   branch_id (FK)
-   supplier_name
-   supply_type\
    **PK:** (branch_id, supplier_name)

------------------------------------------------------------------------

## 🔗 Relationships

-   Employee works in Branch\
-   Branch managed by Employee\
-   Employee supervises Employee\
-   Client belongs to Branch\
-   Employee ↔ Client (Many-to-Many)\
-   Branch has Suppliers

------------------------------------------------------------------------

## ⚙️ Constraints

-   PRIMARY KEY\
-   FOREIGN KEY\
-   ON DELETE SET NULL\
-   ON DELETE CASCADE

------------------------------------------------------------------------

## 🚀 Step-by-Step Execution

### Step 1: Install MySQL

Install MySQL Server or use MySQL Workbench / XAMPP.

### Step 2: Open SQL Tool

Open MySQL Workbench or Command Line.

### Step 3: Create Database

``` sql
CREATE DATABASE TechImpact;
USE TechImpact;
```

### Step 4: Run SQL File

``` sql
SOURCE company_DB_sql_queries.sql;
```

### Step 5: Verify Tables

``` sql
SHOW TABLES;
```

### Step 6: Check Structure

``` sql
DESCRIBE employee;
DESCRIBE branch;
```

### Step 7: View Data

``` sql
SELECT * FROM employee;
SELECT * FROM branch;
SELECT * FROM client;
```

### Step 8: Test Join

``` sql
SELECT e.first_name, b.branch_name
FROM employee e
JOIN branch b ON e.branch_id = b.branch_id;
```

### Step 9: Experiment

-   Insert new data\
-   Update salaries\
-   Delete records to test constraints

------------------------------------------------------------------------

## 📚 Use Cases

-   SQL learning\
-   DBMS practice\
-   Mini project

------------------------------------------------------------------------

## 🛠️ Tech Used

-   MySQL / SQL

------------------------------------------------------------------------

## ✨ Notes

Good for understanding relational databases and real-world data
modeling.
