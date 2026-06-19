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


-- =====================================================
-- Employee Analytics Project
-- Level 2: Salary, Age, Hiring & Business Unit Analysis
-- =====================================================

-- =====================================================
-- DATA CLEANING
-- Convert Annual Salary from VARCHAR to Numeric
-- =====================================================

ALTER TABLE employee_data_csv
ADD COLUMN salary_numeric INT;

UPDATE employee_data_csv
SET salary_numeric =
CAST(
REPLACE(
REPLACE(`Annual Salary`, '$', ''),
',', ''
) AS UNSIGNED
);

-- Verify salary conversion
SELECT
`Annual Salary`,
salary_numeric
FROM employee_data_csv
LIMIT 10;

-- =====================================================
-- SALARY ANALYSIS
-- =====================================================

-- Q18. Highest Salary
SELECT MAX(salary_numeric) AS highest_salary
FROM employee_data_csv;

-- Q19. Lowest Salary
SELECT MIN(salary_numeric) AS lowest_salary
FROM employee_data_csv;

-- Q20. Average Salary
SELECT AVG(salary_numeric) AS average_salary
FROM employee_data_csv;

-- Q21. Total Salary Expense
SELECT SUM(salary_numeric) AS total_salary_expense
FROM employee_data_csv;

-- Q22. Top 10 Highest Paid Employees
SELECT
`Full Name`,
`Job Title`,
salary_numeric
FROM employee_data_csv
ORDER BY salary_numeric DESC
LIMIT 10;

-- Q23. Bottom 10 Lowest Paid Employees
SELECT
`Full Name`,
`Job Title`,
salary_numeric
FROM employee_data_csv
ORDER BY salary_numeric ASC
LIMIT 10;

-- Q24. Average Salary by Department
SELECT
Department,
AVG(salary_numeric) AS average_salary
FROM employee_data_csv
GROUP BY Department;

-- Q25. Department with Highest Average Salary
SELECT
Department,
AVG(salary_numeric) AS average_salary
FROM employee_data_csv
GROUP BY Department
ORDER BY average_salary DESC
LIMIT 1;

-- Q26. Department with Lowest Average Salary
SELECT
Department,
AVG(salary_numeric) AS average_salary
FROM employee_data_csv
GROUP BY Department
ORDER BY average_salary ASC
LIMIT 1;

-- Q27. Average Salary by Gender
SELECT
Gender,
AVG(salary_numeric) AS average_salary
FROM employee_data_csv
GROUP BY Gender;

-- Q28. Average Salary by Country
SELECT
Country,
AVG(salary_numeric) AS average_salary
FROM employee_data_csv
GROUP BY Country;

-- =====================================================
-- AGE ANALYSIS
-- =====================================================

-- Q29. Create Employee Age Groups
SELECT
`Full Name`,
Age,
CASE
WHEN Age < 30 THEN 'Under 30'
WHEN Age BETWEEN 30 AND 39 THEN '30-39'
WHEN Age BETWEEN 40 AND 49 THEN '40-49'
WHEN Age BETWEEN 50 AND 59 THEN '50-59'
ELSE '60+'
END AS age_group
FROM employee_data_csv
ORDER BY Age DESC;

-- Q30. Employee Count by Age Group
SELECT
CASE
WHEN Age < 30 THEN 'Under 30'
WHEN Age BETWEEN 30 AND 39 THEN '30-39'
WHEN Age BETWEEN 40 AND 49 THEN '40-49'
WHEN Age BETWEEN 50 AND 59 THEN '50-59'
ELSE '60+'
END AS age_group,
COUNT(*) AS employee_count
FROM employee_data_csv
GROUP BY age_group
ORDER BY employee_count DESC;

-- Q31. Average Salary by Age Group
SELECT
CASE
WHEN Age < 30 THEN 'Under 30'
WHEN Age BETWEEN 30 AND 39 THEN '30-39'
WHEN Age BETWEEN 40 AND 49 THEN '40-49'
WHEN Age BETWEEN 50 AND 59 THEN '50-59'
ELSE '60+'
END AS age_group,
AVG(salary_numeric) AS average_salary
FROM employee_data_csv
GROUP BY age_group;

-- Q32. Highest Paying Age Group
SELECT
CASE
WHEN Age < 30 THEN 'Under 30'
WHEN Age BETWEEN 30 AND 39 THEN '30-39'
WHEN Age BETWEEN 40 AND 49 THEN '40-49'
WHEN Age BETWEEN 50 AND 59 THEN '50-59'
ELSE '60+'
END AS age_group,
AVG(salary_numeric) AS average_salary
FROM employee_data_csv
GROUP BY age_group
ORDER BY average_salary DESC
LIMIT 1;

-- =====================================================
-- HIRING ANALYSIS
-- =====================================================

-- Q33. Employees Hired Each Year
SELECT
YEAR(`Hire Date`) AS hire_year,
COUNT(*) AS employee_count
FROM employee_data_csv
GROUP BY YEAR(`Hire Date`)
ORDER BY hire_year;

-- Q34. Year with Most Hires
SELECT
YEAR(`Hire Date`) AS hire_year,
COUNT(*) AS employee_count
FROM employee_data_csv
GROUP BY YEAR(`Hire Date`)
ORDER BY employee_count DESC
LIMIT 1;

-- Q35. Employees Hired in the Last 5 Years
SELECT
COUNT(*) AS employees_hired_last_5_years
FROM employee_data_csv
WHERE YEAR(`Hire Date`) >= YEAR(CURDATE()) - 5;

-- Q36. Employees Joined Each Department Per Year
SELECT
YEAR(`Hire Date`) AS hire_year,
Department,
COUNT(*) AS employee_count
FROM employee_data_csv
GROUP BY YEAR(`Hire Date`), Department
ORDER BY hire_year, Department;

-- =====================================================
-- BUSINESS UNIT ANALYSIS
-- =====================================================

-- Q37. Employees per Business Unit
SELECT
`Business Unit`,
COUNT(*) AS employee_count
FROM employee_data_csv
GROUP BY `Business Unit`
ORDER BY employee_count DESC;

-- Q38. Business Unit with Most Employees
SELECT
`Business Unit`,
COUNT(*) AS employee_count
FROM employee_data_csv
GROUP BY `Business Unit`
ORDER BY employee_count DESC
LIMIT 1;

-- Q39. Average Salary by Business Unit
SELECT
`Business Unit`,
AVG(salary_numeric) AS average_salary
FROM employee_data_csv
GROUP BY `Business Unit`
ORDER BY average_salary DESC;

-- Q40. Highest Paying Business Unit
SELECT
`Business Unit`,
AVG(salary_numeric) AS average_salary
FROM employee_data_csv
GROUP BY `Business Unit`
ORDER BY average_salary DESC
LIMIT 1;

-- =====================================================
-- END OF LEVEL 2 ANALYSIS
-- =====================================================





