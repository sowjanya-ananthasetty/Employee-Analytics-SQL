# Employee Analytics SQL Project

## Project Overview

This project focuses on analyzing employee workforce data using SQL. The objective was to strengthen SQL skills through real-world business analysis, reporting, data cleaning, and analytics scenarios.

The dataset contains employee information such as demographics, departments, salaries, business units, locations, and hiring details.

---

# Portfolio Assessment

## Skill Level Before Project

**SQL Skill Level:** Beginner

At the start of this project, the focus was on learning:

* Basic SELECT statements
* Retrieving data from tables
* Understanding SQL syntax
* Simple filtering and sorting

---

## Current Skill Level

**SQL Skill Level:** Intermediate

Through this Employee Analytics project, I developed practical experience in data cleaning, aggregation, business analysis, reporting, and introductory window functions.

---

# Skills Demonstrated

## Data Retrieval & Filtering

* SELECT
* WHERE
* DISTINCT
* ORDER BY
* LIMIT

## Aggregate Functions

* COUNT()
* SUM()
* AVG()
* MIN()
* MAX()

## Grouping & Analysis

* GROUP BY
* Multi-column GROUP BY
* HAVING

## Data Cleaning & Transformation

* ALTER TABLE
* UPDATE
* CAST()
* REPLACE()
* Data Type Conversion
* Creating Analytical Columns

## Conditional Logic

* CASE WHEN
* Business Rule Classification
* Age Group Segmentation

## Date & Time Analysis

* YEAR()
* CURDATE()
* Date-based Filtering
* Hiring Trend Analysis

## Business Analytics

* Employee Demographics Analysis
* Department Analysis
* Gender Analysis
* Salary Analysis
* Country Analysis
* City Analysis
* Hiring Analysis
* Business Unit Analysis

## Reporting & Insights

* Top N Analysis
* Ranking Highest and Lowest Values
* Salary Distribution Analysis
* Workforce Distribution Analysis
* Trend Identification

---

# Project Highlights

## Employee Overview

* Total Employees
* Department Distribution
* Country Distribution
* City Distribution

## Salary Analytics

* Highest Salary
* Lowest Salary
* Average Salary
* Total Salary Expense
* Top 10 Highest Paid Employees
* Bottom 10 Lowest Paid Employees
* Department-wise Salary Analysis
* Gender-wise Salary Analysis
* Country-wise Salary Analysis

## Age Analytics

* Age Group Segmentation using CASE WHEN
* Employee Count by Age Group
* Average Salary by Age Group
* Highest Paying Age Group

## Hiring Analytics

* Employees Hired Per Year
* Year with Maximum Hiring
* Employees Hired in the Last 5 Years
* Department-wise Hiring Trends

## Business Unit Analytics

* Employee Distribution by Business Unit
* Largest Business Unit
* Average Salary by Business Unit
* Highest Paying Business Unit

---

# Data Cleaning Example

```sql
ALTER TABLE employee_data
ADD COLUMN salary_numeric BIGINT;

UPDATE employee_data
SET salary_numeric =
CASE
    WHEN `Annual Salary` IS NULL
         OR `Annual Salary` = ''
    THEN NULL
    ELSE CAST(
            REPLACE(
                REPLACE(`Annual Salary`, '$', ''),
                ',',
                ''
            ) AS UNSIGNED
         )
END;
```

---

# Window Functions Practice

## Topics Covered

✓ AVG() OVER()

✓ SUM() OVER()

✓ MAX() OVER()

✓ MIN() OVER()

✓ PARTITION BY

✓ RANK()

✓ DENSE_RANK()


# Next Learning Goals

## Advanced SQL

* Subqueries
* Common Table Expressions (CTEs)
* Window Functions

  * ROW_NUMBER()
  * RANK()
  * DENSE_RANK()

## Advanced Analytics

* Top 3 Employees per Department
* Highest Paid Employee per Department
* Second Highest Paid Employee per Department
* Salary Bands
* Department Performance Metrics

## Visualization

* Power BI Dashboard
* Tableau Dashboard

---

# Portfolio Rating

| Area              | Rating      |
| ----------------- | ----------- |
| SQL Fundamentals  | 9/10        |
| Data Cleaning     | 8.5/10      |
| Aggregations      | 9/10        |
| Business Analysis | 8.5/10      |
| Intermediate SQL  | 8/10        |
| Advanced SQL      | In Progress |

---

# Overall Portfolio Strength

**Current Rating: 8/10**

This project demonstrates practical SQL skills through real-world employee analytics, business reporting, data cleaning, aggregation, and introductory window-function analysis. It reflects progression from beginner SQL concepts to intermediate-level analytical problem solving.
