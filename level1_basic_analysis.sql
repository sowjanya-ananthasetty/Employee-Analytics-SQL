-- =====================================================
-- Employee Analytics Project
-- Level 1: Basic SQL Analysis
-- Dataset: Employee Sample Data
-- =====================================================

-- =====================================================
-- DATABASE SETUP
-- =====================================================

CREATE DATABASE employee_analytics;

USE employee_analytics;


-- =====================================================
-- TABLE INSPECTION
-- =====================================================

-- View table structure
DESCRIBE employee_data_csv;

-- View available tables
SHOW TABLES;

-- View all records
SELECT *
FROM employee_data_csv;

-- View employees sorted alphabetically
SELECT *
FROM employee_data_csv
ORDER BY `Full Name` ASC;


-- =====================================================
-- EMPLOYEE OVERVIEW
-- =====================================================

-- Q1. Total number of employees
SELECT COUNT(*) AS total_employees
FROM employee_data_csv;


-- Q2. Total number of departments
SELECT COUNT(DISTINCT Department) AS total_departments
FROM employee_data_csv;


-- Q3. List all departments
SELECT DISTINCT Department
FROM employee_data_csv;


-- Q4. Number of employees in each department
SELECT Department,
       COUNT(*) AS employee_count
FROM employee_data_csv
GROUP BY Department;


-- Q5. Department with the highest employee count
SELECT Department,
       COUNT(*) AS employee_count
FROM employee_data_csv
GROUP BY Department
ORDER BY employee_count DESC
LIMIT 1;


-- =====================================================
-- GENDER ANALYSIS
-- =====================================================

-- Q6. Number of male employees
SELECT COUNT(*) AS male_count
FROM employee_data_csv
WHERE Gender = 'Male';


-- Q7. Number of female employees
SELECT COUNT(*) AS female_count
FROM employee_data_csv
WHERE Gender = 'Female';


-- Q8. Gender distribution percentage
SELECT Gender,
       COUNT(*) AS employee_count,
       ROUND(
           COUNT(*) * 100.0 /
           (SELECT COUNT(*) FROM employee_data_csv),
           2
       ) AS percentage
FROM employee_data_csv
GROUP BY Gender;


-- Average age by gender (additional analysis)
SELECT Gender,
       AVG(Age) AS average_age
FROM employee_data_csv
GROUP BY Gender;


-- =====================================================
-- AGE ANALYSIS
-- =====================================================

-- Q9. Average employee age
SELECT AVG(Age) AS average_age
FROM employee_data_csv;


-- Q10. Youngest employee age
SELECT MIN(Age) AS youngest_age
FROM employee_data_csv;


-- Q11. Oldest employee age
SELECT MAX(Age) AS oldest_age
FROM employee_data_csv;


-- Youngest employee details
SELECT `Full Name`,
       Age
FROM employee_data_csv
ORDER BY Age ASC
LIMIT 1;


-- Oldest employee details
SELECT `Full Name`,
       Age
FROM employee_data_csv
ORDER BY Age DESC
LIMIT 1;


-- =====================================================
-- ETHNICITY ANALYSIS
-- =====================================================

-- Q12. Employee count by ethnicity
SELECT Ethnicity,
       COUNT(*) AS employee_count
FROM employee_data_csv
GROUP BY Ethnicity;


-- =====================================================
-- COUNTRY ANALYSIS
-- =====================================================

-- Q13. Number of countries represented
SELECT COUNT(DISTINCT Country) AS total_countries
FROM employee_data_csv;


-- Q14. Employee count by country
SELECT Country,
       COUNT(*) AS employee_count
FROM employee_data_csv
GROUP BY Country;


-- Q15. Country with highest employee count
SELECT Country,
       COUNT(*) AS employee_count
FROM employee_data_csv
GROUP BY Country
ORDER BY employee_count DESC
LIMIT 1;


-- =====================================================
-- CITY ANALYSIS
-- =====================================================

-- Q16. Employee count by city
SELECT City,
       COUNT(*) AS employee_count
FROM employee_data_csv
GROUP BY City;


-- Q17. City with highest employee count
SELECT City,
       COUNT(*) AS employee_count
FROM employee_data_csv
GROUP BY City
ORDER BY employee_count DESC
LIMIT 1;


-- =====================================================
-- END OF LEVEL 1 ANALYSIS
-- =====================================================
